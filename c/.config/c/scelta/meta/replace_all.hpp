// Copyright (c) 2017 Vittorio Romeo
// MIT License |  https://opensource.org/licenses/MIT
// http://vittorioromeo.info | vittorio.romeo@outlook.com

#pragma once

#include "./copy_cv_ptr_ref.hpp"
#include <type_traits>

namespace scelta::meta
{
    namespace impl
    {
        /// @brief Matches types exactly equivalent to `T`.
        template <typename T>
        using identity_check = T;

        /// @brief Replaces types with exactly `T`.
        template <typename, typename T>
        using identity_replace = T;

        template <                                            //
            template <typename> typename OnCheck,             //
            template <typename, typename> typename OnReplace, //
            typename Before, typename After,                  //
            typename T                                        //
            >
        struct apply : std::conditional<                       //
                           std::is_same_v<OnCheck<T>, Before>, //
                           OnReplace<T, After>,                //
                           T>
        {
        };

        template <                                            //
            template <typename> typename OnCheck,             //
            template <typename, typename> typename OnReplace, //
            typename Before, typename After,                  //
            template <typename...> typename T, typename... Ts //
            >
        struct apply<OnCheck, OnReplace, Before, After, T<Ts...>>
        {
            using type = T<
                typename apply<OnCheck, OnReplace, Before, After, Ts>::type...>;
        };

        template <                                           //
            template <typename> typename OnCheck,            //
            template <typename, typename> typename OnReplace //
            >
        struct replace_all_impl
        {
            template <typename Before, typename After, typename T>
            using apply_t =
                typename apply<OnCheck, OnReplace, Before, After, T>::type;
        };

        using identity_replacer =
            replace_all_impl<identity_check, identity_replace>;

        using copy_cv_ref_ptr_replacer =
            replace_all_impl<remove_cv_ref_ptr_t, copy_cv_ptr_ref_t>;
    }

    /// @brief Replaces all exact occurrences of `Before` with `After` in `T`.
    /// @details Replacements are applied recursively (for nested types).
    /// CVs/pointer/refs are not "ignored".
    /// @code{.cpp}
    /// using src = A<A<B<A<B<C, B*>>>>>
    /// using res = replace_all_t<B, X, src>;
    /// static_assert(std::is_same_v<res,
    ///    A<A<X<A<X<C, B*>>>>>
    /// >);
    /// @endcode
    template <typename Before, typename After, typename T>
    using replace_all_t = impl::identity_replacer::apply_t<Before, After, T>;

    /// @brief Replaces all occurrences of `Before` with `After` in `T`.
    /// @details Replacements are applied recursively (for nested types).
    /// CVs/pointer/refs are "ignored" (e.g. `Before&` becomes `After&`).
    /// @code{.cpp}
    /// using src = A<A<B<A<B<C, B*>>>>>
    /// using res = replace_all_t<B, X, src>;
    /// static_assert(std::is_same_v<res,
    ///    A<A<X<A<X<C, X*>>>>>
    /// >);
    /// @endcode
    template <typename Before, typename After, typename T>
    using replace_all_copy_cv_ptr_ref_t =
        impl::copy_cv_ref_ptr_replacer::apply_t<Before, After, T>;
}

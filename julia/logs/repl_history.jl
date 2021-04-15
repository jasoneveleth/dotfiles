# time: 2021-03-25 13:36:48 EDT
# mode: julia
	2^6 % 6
# time: 2021-03-25 13:36:57 EDT
# mode: julia
	3^6 % 6
# time: 2021-03-25 13:58:19 EDT
# mode: julia
	sqrt(i)
# time: 2021-03-25 13:58:23 EDT
# mode: julia
	sqrt(im)
# time: 2021-03-25 13:59:27 EDT
# mode: julia
	sqrt(-im)
# time: 2021-03-25 14:28:36 EDT
# mode: julia
	a = 3^(1/2) + 7^(1/3)
# time: 2021-03-25 14:28:42 EDT
# mode: julia
	type(a)
# time: 2021-03-25 14:28:46 EDT
# mode: julia
	typeof(a)
# time: 2021-03-25 14:29:17 EDT
# mode: julia
	a^6 - 9a^4 - 14a^3 + 27a^2 - 126a +22
# time: 2021-03-25 22:36:48 EDT
# mode: julia
	clear
# time: 2021-03-25 22:37:05 EDT
# mode: julia
	a = [1 0; 0 0]
# time: 2021-03-25 22:37:05 EDT
# mode: julia
	a
# time: 2021-03-25 22:37:22 EDT
# mode: julia
	a * [0 0; 0 0]
# time: 2021-03-25 22:37:28 EDT
# mode: julia
	a * [1 0; 0 0]
# time: 2021-03-25 22:37:56 EDT
# mode: julia
	a * [0 0; 0 1]
# time: 2021-03-25 22:38:01 EDT
# mode: julia
	a * [0 0; 1 0]
# time: 2021-03-25 22:38:05 EDT
# mode: julia
	a * [0 0; 1 1]
# time: 2021-03-25 22:38:10 EDT
# mode: julia
	a * [0 1; 0 0]
# time: 2021-03-25 22:38:25 EDT
# mode: julia
	a * [0 1; 0 1]
# time: 2021-03-25 22:38:29 EDT
# mode: julia
	a * [0 1; 1 0]
# time: 2021-03-25 22:38:32 EDT
# mode: julia
	a * [0 1; 0 1]
# time: 2021-03-25 22:38:40 EDT
# mode: julia
	a * [1 0; 0 0]
# time: 2021-03-25 22:38:44 EDT
# mode: julia
	a * [1 0; 0 1]
# time: 2021-03-25 22:38:49 EDT
# mode: julia
	a * [1 0; 1 0]
# time: 2021-03-25 22:38:56 EDT
# mode: julia
	a * [1 0; 1 1]
# time: 2021-03-25 22:39:05 EDT
# mode: julia
	a * [1 1; 0 0]
# time: 2021-03-25 22:39:33 EDT
# mode: julia
	2^4
# time: 2021-03-25 22:40:09 EDT
# mode: julia
	[1 1; 0 0]
# time: 2021-03-25 22:41:04 EDT
# mode: julia
	[1 1; 0 0] * [1 1; 0 0]
# time: 2021-03-25 22:41:08 EDT
# mode: julia
	[1 1; 0 0] * [1 0; 0 0]
# time: 2021-03-25 22:41:11 EDT
# mode: julia
	[1 1; 0 0] * [0 1; 0 0]
# time: 2021-03-25 22:41:19 EDT
# mode: julia
	[1 1; 0 0] * [0 1; 1 0]
# time: 2021-03-25 22:41:23 EDT
# mode: julia
	[1 1; 0 0] * [0 1; 0 1]
# time: 2021-03-25 22:41:31 EDT
# mode: julia
	[1 1; 0 0] * [1 1; 0 1]
# time: 2021-03-25 22:41:36 EDT
# mode: julia
	[1 1; 0 0] * [1 0; 0 1]
# time: 2021-03-25 22:42:25 EDT
# mode: julia
	[1 1; 1 1] * a
# time: 2021-03-26 01:56:15 EDT
# mode: julia
	for i = 1..9
	    for j = 1..9
	        println(i,j, i*j % 9)
	    end
	end
# time: 2021-03-26 01:56:37 EDT
# mode: julia
	for i in 1..9
	    for j in 1..9
	        println(i,j, i*j % 9)
	    end
	end
# time: 2021-03-26 01:57:14 EDT
# mode: julia
	for i in 1:9
	    for j in 1:9
	        println(i,j, i*j % 9)
	    end
	end
# time: 2021-03-26 01:57:39 EDT
# mode: julia
	for i in 1:9
	    for j in 1:9
	        println(i, j, i*j % 9)
	    end
	end
# time: 2021-03-26 01:57:47 EDT
# mode: julia
	for i in 1:9
	    println(i)for j in 1:9
	        println(i, j, i*j % 9)
	    end
	end
# time: 2021-03-26 01:57:59 EDT
# mode: julia
	for i in 1:9
	    println(i)
	    for j in 1:9
	        println(i*j % 9)
	    end
	end
# time: 2021-03-26 01:58:19 EDT
# mode: julia
	for i in 1:9
	    println("i is: ", i)
	    for j in 1:9
	        println(i*j % 9)
	    end
	end
# time: 2021-03-26 01:58:53 EDT
# mode: julia
	clear
# time: 2021-03-26 01:59:16 EDT
# mode: julia
	for i in 1:8
	    a = i
	end
# time: 2021-03-26 01:59:48 EDT
# mode: julia
	for i in 1:8
	    a = i
	    while a != 0
	        println(a)
	        a += i
	    end
	end
# time: 2021-03-26 02:00:25 EDT
# mode: julia
	for i in 1:8
	    a = i
	    while a != 0
	        println(a)
	        a += i
	        a %= 9
	    end
	end
# time: 2021-03-26 02:00:43 EDT
# mode: julia
	for i in 1:8
	    a = i
	    println(a)
	    while a != 0
	        println(a)
	        a += i
	        a %= 9
	    end
	end
# time: 2021-03-26 02:00:59 EDT
# mode: julia
	for i in 1:8
	    a = i
	    println("i is: ", i)
	    while a != 0
	        println(a)
	        a += i
	        a %= 9
	    end
	end
# time: 2021-03-26 02:02:38 EDT
# mode: julia
	for i in 1:8
	    a = i
	    counter = 0
	    while a != 0
	        println(a)
	        a += i
	        a %= 9
	        counter += 1
	    end
	    if counter < 9
	        println("i is: ", i)
	    end
	end
# time: 2021-03-26 12:48:00 EDT
# mode: julia
	pi
# time: 2021-03-26 12:48:20 EDT
# mode: julia
	pi * 2
# time: 2021-03-26 12:48:23 EDT
# mode: julia
	pi * 3
# time: 2021-03-26 12:48:24 EDT
# mode: julia
	pi * 4
# time: 2021-03-26 12:48:51 EDT
# mode: julia
	pi * 5
# time: 2021-03-26 12:48:53 EDT
# mode: julia
	pi * 6
# time: 2021-03-26 12:48:54 EDT
# mode: julia
	pi * 7
# time: 2021-03-26 13:24:45 EDT
# mode: julia
	pi*8
# time: 2021-03-26 13:24:46 EDT
# mode: julia
	pi*9
# time: 2021-03-26 17:04:01 EDT
# mode: julia
	ls
# time: 2021-03-26 17:05:13 EDT
# mode: julia
	function grade(hw, mt, fn)
	    (hw*0.5 + mt*0.25 + fn*0.25)*100
	    end
# time: 2021-03-26 17:06:08 EDT
# mode: julia
	grade(21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30, 50/55, 0.9)
# time: 2021-03-26 17:06:23 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30)/6, 50/55, 0.9)
# time: 2021-03-26 17:06:31 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30 + 30/30)/7, 50/55, 0.9)
# time: 2021-04-06 14:34:35 EDT
# mode: julia
	function grade(hw, mt, fn)
	    (hw*0.5 + mt*0.25 + fn*0.25)*100
	    end
# time: 2021-04-06 14:38:18 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 19.5/30 + 23.5/30 + 33/30 + 22.5/30)/7, 50/55, 0.9)
# time: 2021-04-06 14:38:31 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 19.5/30 + 23.5/30 + 33/30 + 22.5/30)/9, 50/55, 0.9)
# time: 2021-04-06 14:38:42 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 19.5/30 + 23.5/30 + 33/30 + 22.5/30)/9, 50/55, 1)
# time: 2021-04-06 14:48:03 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 19.5/30 + 23.5/30 + 33/30 + 22.5/30)/9, 50/55, 0.94)
# time: 2021-04-06 15:03:07 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 19.5/30 + 23.5/30 + 33/30 + 22.5/30)/9, 50/55, 0.95)
# time: 2021-04-06 15:04:06 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 19.5/30 + 23.5/30 + 33/30 + 22.5/30)/9, 50/55, 0.96)
# time: 2021-04-06 15:06:09 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30 + 33/30 + 22.5/30)/8, 50/55, 0.9)
# time: 2021-04-06 15:22:54 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30 + 33/30 + 22.5/30)/8, 50/55, 0.85)
# time: 2021-04-06 15:23:00 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30 + 33/30 + 22.5/30)/8, 50/55, 0.87)
# time: 2021-04-06 15:23:02 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30 + 33/30 + 22.5/30)/8, 50/55, 0.88)
# time: 2021-04-06 15:23:08 EDT
# mode: julia
	grade((21/30 + 23/30 + 35/30 + 31/30 + 26.5/30 + 23.5/30 + 33/30 + 22.5/30)/8, 50/55, 0.89)
# time: 2021-04-13 23:11:14 EDT
# mode: julia
	function inverse(a, m):
	    for 1:m-1
# time: 2021-04-13 23:12:20 EDT
# mode: julia
	function inverse(a, m)
	    for i in 1:m-1
	        if i*a % m == 1
	            print(i)
	        end
	    end
	end
# time: 2021-04-13 23:12:31 EDT
# mode: julia
	inverse(117, 119)
# time: 2021-04-13 23:12:45 EDT
# mode: julia
	117 * 59 % 119
# time: 2021-04-13 23:13:11 EDT
# mode: julia
	4*59
# time: 2021-04-13 23:13:28 EDT
# mode: julia
	236-119
# time: 2021-04-13 23:14:00 EDT
# mode: julia
	117(117)
# time: 2021-04-13 23:14:07 EDT
# mode: julia
	37 + 117(117)
# time: 2021-04-13 23:14:22 EDT
# mode: julia
	13726 % 119
# time: 2021-04-13 23:14:29 EDT
# mode: julia
	13726 % 117
# time: 2021-04-13 23:16:39 EDT
# mode: julia
	38 - 7
# time: 2021-04-13 23:16:56 EDT
# mode: julia
	inverse(13, 77)
# time: 2021-04-13 23:17:09 EDT
# mode: julia
	31*6
# time: 2021-04-13 23:17:21 EDT
# mode: julia
	inverse(12,13)
# time: 2021-04-13 23:17:49 EDT
# mode: julia
	186%77
# time: 2021-04-13 23:18:22 EDT
# mode: julia
	7 + 13*22
# time: 2021-04-13 23:18:34 EDT
# mode: julia
	293%77
# time: 2021-04-13 23:20:11 EDT
# mode: julia
	7+38*13
# time: 2021-04-13 23:20:22 EDT
# mode: julia
	501%77
# time: 2021-04-13 23:21:50 EDT
# mode: julia
	13*6
# time: 2021-04-13 23:21:58 EDT
# mode: julia
	31 * 6
# time: 2021-04-13 23:22:07 EDT
# mode: julia
	ans % 77
# time: 2021-04-13 23:22:43 EDT
# mode: julia
	32*13
# time: 2021-04-13 23:22:46 EDT
# mode: julia
	32*13 + 7
# time: 2021-04-13 23:23:06 EDT
# mode: julia
	inverse(15, 17)
# time: 2021-04-13 23:23:34 EDT
# mode: julia
	13*77
# time: 2021-04-13 23:24:15 EDT
# mode: julia
	432-11
# time: 2021-04-13 23:24:28 EDT
# mode: julia
	inverse(17, 1001)
# time: 2021-04-13 23:24:48 EDT
# mode: julia
	421*530
# time: 2021-04-13 23:25:08 EDT
# mode: julia
	ans % 1001
# time: 2021-04-13 23:25:32 EDT
# mode: julia
	11 + 17(908)
# time: 2021-04-13 23:25:51 EDT
# mode: julia
	ans % 1001
# time: 2021-04-13 23:25:55 EDT
# mode: julia
	15447 % 17
# time: 2021-04-13 23:26:31 EDT
# mode: julia
	2425 % 17
# time: 2021-04-13 23:26:34 EDT
# mode: julia
	2425 % 1001
# time: 2021-04-13 23:26:42 EDT
# mode: julia
	15447 - 2425
# time: 2021-04-13 23:26:49 EDT
# mode: julia
	1001*17
# time: 2021-04-13 23:29:05 EDT
# mode: julia
	1001 % 17
# time: 2021-04-13 23:29:14 EDT
# mode: julia
	11-423 % 17
# time: 2021-04-13 23:29:17 EDT
# mode: julia
	11-423
# time: 2021-04-13 23:29:35 EDT
# mode: julia
	11-423 % 17
# time: 2021-04-13 23:29:37 EDT
# mode: julia
	11-423 % 17 + 17
# time: 2021-04-13 23:29:59 EDT
# mode: julia
	inverse(17, 1001)
# time: 2021-04-13 23:30:04 EDT
# mode: julia
	inverse(15, 17)
# time: 2021-04-13 23:30:13 EDT
# mode: julia
	13*8
# time: 2021-04-13 23:30:17 EDT
# mode: julia
	ans % 17
# time: 2021-04-13 23:30:52 EDT
# mode: julia
	423 + 2 * 1001
# time: 2021-04-13 23:31:34 EDT
# mode: julia
	inverse(3, 5)
# time: 2021-04-13 23:31:44 EDT
# mode: julia
	inverse(5, 7)
# time: 2021-04-13 23:33:08 EDT
# mode: julia
	2-14
# time: 2021-04-13 23:33:11 EDT
# mode: julia
	ans % 7
# time: 2021-04-13 23:33:53 EDT
# mode: julia
	14 - 30

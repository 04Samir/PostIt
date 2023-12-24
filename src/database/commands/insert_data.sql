USE forumApp;


INSERT INTO `users` (
  `id`, `username`, `password`, `created_at`
) 
VALUES 
  (
    1, 'BobSmith', '$2b$10$g.t3KlZrKIpLyTKcclXNyOcoadnQsxyZC.Ipa1Ke/FhxSdFe55v0e', 
    '2023-11-23 15:58:34'
  ), 
  (
    2, 'JoeGarcia', '$2b$10$VCCIZWwUGQ.uTYm9VyuxUeV50npVkQGko/zo.Q.lgktU.dAyYE8Uq', 
    '2023-12-15 15:58:34'
  ), 
  (
    3, 'KarenWong', '$2b$10$B81lM/g5c9zzEuJNWnnXkemKADGNp4/AUfplorqCFdAC9BVgxp/vC', 
    '2023-12-13 15:58:34'
  ), 
  (
    4, 'AliceSmith', '$2b$10$40XF2Be1WtT.YqvoyyVaKOsjPmLEfQaVTA.SsyhpNMndbrJ.C.Hlu', 
    '2023-11-27 15:58:34'
  ), 
  (
    5, 'CarlosGarcia', '$2b$10$W4OiJ15D8v2A0tciU7XDBOM.p4FbktiRuGjwKjitnwVIuSYMn2Y9i', 
    '2023-12-18 15:58:34'
  ), 
  (
    6, 'LilyWong', '$2b$10$QUURn7Avf.FhqD8rW7JbO.dB2G6mcq/qaeZROfWp7fNAJfZUGDLDu', 
    '2023-12-16 15:58:34'
  ), 
  (
    7, 'MohammedKhan', '$2b$10$ehzLsFcNS2xvHa7eqia21.lkTxnHc6JIZxNdf/CBemcs0osSqy0PO', 
    '2023-12-06 15:58:34'
  ), 
  (
    8, 'IsabellaDavis', '$2b$10$nEHzGV4LutvHiF3iGNS6TuXUUkHoYSKhy8KMuMf8kawbfI1xMENLW', 
    '2023-12-18 15:58:34'
  ), 
  (
    9, 'RaviPatel', '$2b$10$u61WdxLBv6lrTd0OQ5/l/upf5AXjs2qi.lQJeQPT4vY4LDKi70Inm', 
    '2023-12-20 15:58:34'
  ), 
  (
    10, 'AyaYamamoto', '$2b$10$BnujcG9zX5wx9L3xmuuxDOy1msjRL0a/cWsYODhvH9n5pH/b1VajS', 
    '2023-11-24 15:58:34'
  ), 
  (
    11, 'SamuelJones', '$2b$10$rmfN/qpK8UxamxVZiblNzO4dqnAT8BmYb9Me1goBkIbgYrDz3Qbaa', 
    '2023-12-09 15:58:34'
  ), 
  (
    12, 'MiaLopez', '$2b$10$TRWfvyEBV/yWbvtmbag52ucX5K2EfoqB0/VeltoNgVvVDJbMAdRha', 
    '2023-12-13 15:58:34'
  ), 
  (
    13, 'ElijahTaylor', '$2b$10$7yb8LgSiERd8gfA3D57QhOnAV8xYzWJJ5fwOML407me.WJJFBLCK6', 
    '2023-12-18 15:58:34'
  ), 
  (
    14, 'SofiaHernandez', '$2b$10$NsPnQANcLNV/dcv5Sa/UueficxQarxRgRzS3/l./NaJqBHX3vIx8e', 
    '2023-11-26 15:58:34'
  ), 
  (
    15, 'AmirMohamed', '$2b$10$OQ2gYDp8o2sgnLqVtu0Wf.BVklbqPQ1c.p0tXIP/uVEeK1cuZ5Oli', 
    '2023-11-27 15:58:34'
  ), 
  (
    16, 'GraceJohnson', '$2b$10$bVFotXrZlTj3b3JV3SqCw.heXR5.eksfcl0d4UzqBMGEISk3PtzXK', 
    '2023-12-05 15:58:34'
  ), 
  (
    17, 'DanielLee', '$2b$10$gyqTBeBM3A.x3y5y7Hxl7O5nnJ6mxRHkMhM2E2ZZvYMPP3SEkyHKS', 
    '2023-12-14 15:58:34'
  );


INSERT INTO `topics` (`id`, `name`) 
VALUES 
  (1, 'Art'), 
  (2, 'Business'), 
  (3, 'Cars'), 
  (4, 'Cats'), 
  (5, 'Fashion'), 
  (6, 'Food'), 
  (7, 'Gaming'), 
  (8, 'Movies'), 
  (9, 'Music'), 
  (10, 'Programming'), 
  (11, 'Science'), 
  (12, 'Sports'), 
  (13, 'Television'), 
  (14, 'Travel'), 
  (15, 'Other');

  
INSERT INTO `user_topic` (`user_id`, `topic_id`) 
VALUES 
  (10, 1), 
  (12, 1), 
  (17, 1), 
  (6, 2), 
  (8, 2), 
  (9, 2), 
  (2, 3), 
  (6, 3), 
  (9, 3), 
  (15, 3), 
  (16, 3), 
  (15, 4), 
  (1, 5), 
  (8, 5), 
  (13, 5), 
  (17, 5), 
  (3, 6), 
  (7, 6), 
  (11, 6), 
  (12, 6), 
  (5, 7), 
  (11, 7), 
  (16, 7), 
  (1, 8), 
  (2, 8), 
  (4, 8), 
  (8, 8), 
  (1, 9), 
  (7, 9), 
  (10, 9), 
  (5, 10), 
  (13, 10), 
  (1, 11), 
  (4, 11), 
  (8, 11), 
  (10, 11), 
  (13, 11), 
  (17, 11), 
  (10, 12), 
  (15, 12), 
  (16, 12), 
  (7, 13), 
  (14, 13), 
  (15, 13), 
  (16, 13), 
  (11, 14), 
  (12, 14), 
  (13, 14), 
  (7, 15), 
  (11, 15), 
  (15, 15);


INSERT INTO `posts` (
  `id`, `title`, `content`, `user_id`, 
  `topic_id`, `created_at`
) 
VALUES 
  (
    1, 'This is a Post about Art', 'This is the Content of the Post about Art', 
    10, 1, '2023-12-13 23:16:29'
  ), 
  (
    2, 'This is a Post about Art', 'This is the Content of the Post about Art', 
    12, 1, '2023-12-16 11:46:20'
  ), 
  (
    3, 'This is a Post about Art', 'This is the Content of the Post about Art', 
    17, 1, '2023-12-17 22:44:15'
  ), 
  (
    4, 'This is a Post about Business', 
    'This is the Content of the Post about Business', 
    6, 2, '2023-12-20 12:09:27'
  ), 
  (
    5, 'This is a Post about Business', 
    'This is the Content of the Post about Business', 
    8, 2, '2023-12-21 12:14:14'
  ), 
  (
    6, 'This is a Post about Business', 
    'This is the Content of the Post about Business', 
    9, 2, '2023-12-20 18:33:29'
  ), 
  (
    7, 'This is a Post about Cars', 'This is the Content of the Post about Cars', 
    2, 3, '2023-12-20 00:42:14'
  ), 
  (
    8, 'This is a Post about Cars', 'This is the Content of the Post about Cars', 
    6, 3, '2023-12-17 06:58:50'
  ), 
  (
    9, 'This is a Post about Cars', 'This is the Content of the Post about Cars', 
    9, 3, '2023-12-20 19:59:35'
  ), 
  (
    10, 'This is a Post about Cars', 
    'This is the Content of the Post about Cars', 
    15, 3, '2023-12-19 22:17:22'
  ), 
  (
    11, 'This is a Post about Cars', 
    'This is the Content of the Post about Cars', 
    16, 3, '2023-12-10 04:34:14'
  ), 
  (
    12, 'This is a Post about Cats', 
    'This is the Content of the Post about Cats', 
    15, 4, '2023-12-09 06:00:59'
  ), 
  (
    13, 'This is a Post about Fashion', 
    'This is the Content of the Post about Fashion', 
    1, 5, '2023-11-27 19:39:42'
  ), 
  (
    14, 'This is a Post about Fashion', 
    'This is the Content of the Post about Fashion', 
    8, 5, '2023-12-19 08:58:39'
  ), 
  (
    15, 'This is a Post about Fashion', 
    'This is the Content of the Post about Fashion', 
    13, 5, '2023-12-19 12:35:20'
  ), 
  (
    16, 'This is a Post about Fashion', 
    'This is the Content of the Post about Fashion', 
    17, 5, '2023-12-19 21:14:30'
  ), 
  (
    17, 'This is a Post about Food', 
    'This is the Content of the Post about Food', 
    3, 6, '2023-12-19 12:01:58'
  ), 
  (
    18, 'This is a Post about Food', 
    'This is the Content of the Post about Food', 
    7, 6, '2023-12-11 00:01:12'
  ), 
  (
    19, 'This is a Post about Food', 
    'This is the Content of the Post about Food', 
    11, 6, '2023-12-20 12:03:50'
  ), 
  (
    20, 'This is a Post about Food', 
    'This is the Content of the Post about Food', 
    12, 6, '2023-12-15 18:00:20'
  ), 
  (
    21, 'This is a Post about Gaming', 
    'This is the Content of the Post about Gaming', 
    5, 7, '2023-12-21 01:54:37'
  ), 
  (
    22, 'This is a Post about Gaming', 
    'This is the Content of the Post about Gaming', 
    11, 7, '2023-12-16 18:30:14'
  ), 
  (
    23, 'This is a Post about Gaming', 
    'This is the Content of the Post about Gaming', 
    16, 7, '2023-12-14 00:08:54'
  ), 
  (
    24, 'This is a Post about Movies', 
    'This is the Content of the Post about Movies', 
    1, 8, '2023-12-11 11:36:00'
  ), 
  (
    25, 'This is a Post about Movies', 
    'This is the Content of the Post about Movies', 
    2, 8, '2023-12-16 19:49:10'
  ), 
  (
    26, 'This is a Post about Movies', 
    'This is the Content of the Post about Movies', 
    4, 8, '2023-11-29 21:47:14'
  ), 
  (
    27, 'This is a Post about Movies', 
    'This is the Content of the Post about Movies', 
    8, 8, '2023-12-18 18:40:33'
  ), 
  (
    28, 'This is a Post about Music', 
    'This is the Content of the Post about Music', 
    1, 9, '2023-12-07 08:06:06'
  ), 
  (
    29, 'This is a Post about Music', 
    'This is the Content of the Post about Music', 
    7, 9, '2023-12-18 10:52:27'
  ), 
  (
    30, 'This is a Post about Music', 
    'This is the Content of the Post about Music', 
    10, 9, '2023-12-10 06:46:01'
  ), 
  (
    31, 'This is a Post about Programming', 
    'This is the Content of the Post about Programming', 
    5, 10, '2023-12-19 09:09:57'
  ), 
  (
    32, 'This is a Post about Programming', 
    'This is the Content of the Post about Programming', 
    13, 10, '2023-12-19 13:58:58'
  ), 
  (
    33, 'This is a Post about Science', 
    'This is the Content of the Post about Science', 
    1, 11, '2023-12-19 15:14:56'
  ), 
  (
    34, 'This is a Post about Science', 
    'This is the Content of the Post about Science', 
    4, 11, '2023-11-30 17:01:54'
  ), 
  (
    35, 'This is a Post about Science', 
    'This is the Content of the Post about Science', 
    8, 11, '2023-12-19 22:12:47'
  ), 
  (
    36, 'This is a Post about Science', 
    'This is the Content of the Post about Science', 
    10, 11, '2023-12-06 13:44:06'
  ), 
  (
    37, 'This is a Post about Science', 
    'This is the Content of the Post about Science', 
    13, 11, '2023-12-19 20:46:47'
  ), 
  (
    38, 'This is a Post about Science', 
    'This is the Content of the Post about Science', 
    17, 11, '2023-12-14 19:51:43'
  ), 
  (
    39, 'This is a Post about Sports', 
    'This is the Content of the Post about Sports', 
    10, 12, '2023-12-02 13:54:03'
  ), 
  (
    40, 'This is a Post about Sports', 
    'This is the Content of the Post about Sports', 
    15, 12, '2023-12-14 21:17:22'
  ), 
  (
    41, 'This is a Post about Sports', 
    'This is the Content of the Post about Sports', 
    16, 12, '2023-12-13 04:41:06'
  ), 
  (
    42, 'This is a Post about Television', 
    'This is the Content of the Post about Television', 
    7, 13, '2023-12-16 14:07:15'
  ), 
  (
    43, 'This is a Post about Television', 
    'This is the Content of the Post about Television', 
    14, 13, '2023-12-02 12:11:17'
  ), 
  (
    44, 'This is a Post about Television', 
    'This is the Content of the Post about Television', 
    15, 13, '2023-12-04 20:01:04'
  ), 
  (
    45, 'This is a Post about Television', 
    'This is the Content of the Post about Television', 
    16, 13, '2023-12-06 09:44:52'
  ), 
  (
    46, 'This is a Post about Travel', 
    'This is the Content of the Post about Travel', 
    11, 14, '2023-12-18 22:29:15'
  ), 
  (
    47, 'This is a Post about Travel', 
    'This is the Content of the Post about Travel', 
    12, 14, '2023-12-16 01:40:47'
  ), 
  (
    48, 'This is a Post about Travel', 
    'This is the Content of the Post about Travel', 
    13, 14, '2023-12-21 04:39:40'
  ), 
  (
    49, 'This is a Post about Other', 
    'This is the Content of the Post about Other', 
    7, 15, '2023-12-12 00:16:53'
  ), 
  (
    50, 'This is a Post about Other', 
    'This is the Content of the Post about Other', 
    11, 15, '2023-12-18 19:29:56'
  ), 
  (
    51, 'This is a Post about Other', 
    'This is the Content of the Post about Other', 
    15, 15, '2023-12-14 00:32:34'
  );


INSERT INTO `comments` (
  `id`, `content`, `user_id`, `parent_id`, 
  `post_id`, `created_at`
) 
VALUES 
  (
    1, 'This is a Comment about Art', 
    10, NULL, 2, '2023-12-19 19:28:06'
  ), 
  (
    2, 'This is a Comment about Art', 
    10, NULL, 3, '2023-12-19 20:22:04'
  ), 
  (
    3, 'This is a Comment about Art', 
    12, NULL, 1, '2023-12-21 13:41:40'
  ), 
  (
    4, 'This is a Comment about Art', 
    12, NULL, 3, '2023-12-18 02:05:06'
  ), 
  (
    5, 'This is a Comment about Art', 
    17, NULL, 1, '2023-12-18 13:34:08'
  ), 
  (
    6, 'This is a Comment about Art', 
    17, NULL, 2, '2023-12-17 13:34:18'
  ), 
  (
    7, 'This is a Comment about Business', 
    6, NULL, 5, '2023-12-21 15:55:29'
  ), 
  (
    8, 'This is a Comment about Business', 
    6, NULL, 6, '2023-12-21 01:54:55'
  ), 
  (
    9, 'This is a Comment about Business', 
    8, NULL, 4, '2023-12-21 10:59:29'
  ), 
  (
    10, 'This is a Comment about Business', 
    8, NULL, 6, '2023-12-21 07:51:57'
  ), 
  (
    11, 'This is a Comment about Business', 
    9, NULL, 4, '2023-12-20 18:30:47'
  ), 
  (
    12, 'This is a Comment about Business', 
    9, NULL, 5, '2023-12-21 14:49:35'
  ), 
  (
    13, 'This is a Comment about Cars', 
    2, NULL, 8, '2023-12-18 11:03:15'
  ), 
  (
    14, 'This is a Comment about Cars', 
    2, NULL, 9, '2023-12-20 20:37:20'
  ), 
  (
    15, 'This is a Comment about Cars', 
    2, NULL, 10, '2023-12-21 07:29:25'
  ), 
  (
    16, 'This is a Comment about Cars', 
    2, NULL, 11, '2023-12-18 18:29:14'
  ), 
  (
    17, 'This is a Comment about Cars', 
    6, NULL, 7, '2023-12-20 17:27:12'
  ), 
  (
    18, 'This is a Comment about Cars', 
    6, NULL, 9, '2023-12-21 14:12:54'
  ), 
  (
    19, 'This is a Comment about Cars', 
    6, NULL, 10, '2023-12-20 12:42:02'
  ), 
  (
    20, 'This is a Comment about Cars', 
    6, NULL, 11, '2023-12-12 03:01:37'
  ), 
  (
    21, 'This is a Comment about Cars', 
    9, NULL, 7, '2023-12-21 06:32:29'
  ), 
  (
    22, 'This is a Comment about Cars', 
    9, NULL, 8, '2023-12-19 17:22:24'
  ), 
  (
    23, 'This is a Comment about Cars', 
    9, NULL, 10, '2023-12-21 12:33:15'
  ), 
  (
    24, 'This is a Comment about Cars', 
    9, NULL, 11, '2023-12-13 13:12:36'
  ), 
  (
    25, 'This is a Comment about Cars', 
    15, NULL, 7, '2023-12-21 13:23:36'
  ), 
  (
    26, 'This is a Comment about Cars', 
    15, NULL, 8, '2023-12-20 22:09:10'
  ), 
  (
    27, 'This is a Comment about Cars', 
    15, NULL, 9, '2023-12-21 10:29:37'
  ), 
  (
    28, 'This is a Comment about Cars', 
    15, NULL, 11, '2023-12-12 18:38:22'
  ), 
  (
    29, 'This is a Comment about Cars', 
    16, NULL, 7, '2023-12-21 11:19:12'
  ), 
  (
    30, 'This is a Comment about Cars', 
    16, NULL, 8, '2023-12-19 11:47:18'
  ), 
  (
    31, 'This is a Comment about Cars', 
    16, NULL, 9, '2023-12-21 09:22:38'
  ), 
  (
    32, 'This is a Comment about Cars', 
    16, NULL, 10, '2023-12-21 03:49:48'
  ), 
  (
    33, 'This is a Comment about Fashion', 
    1, NULL, 14, '2023-12-20 17:44:58'
  ), 
  (
    34, 'This is a Comment about Fashion', 
    1, NULL, 15, '2023-12-19 13:31:43'
  ), 
  (
    35, 'This is a Comment about Fashion', 
    1, NULL, 16, '2023-12-20 11:44:00'
  ), 
  (
    36, 'This is a Comment about Fashion', 
    8, NULL, 13, '2023-12-17 10:35:02'
  ), 
  (
    37, 'This is a Comment about Fashion', 
    8, NULL, 15, '2023-12-21 04:15:49'
  ), 
  (
    38, 'This is a Comment about Fashion', 
    8, NULL, 16, '2023-12-20 06:17:55'
  ), 
  (
    39, 'This is a Comment about Fashion', 
    13, NULL, 13, '2023-12-10 06:23:27'
  ), 
  (
    40, 'This is a Comment about Fashion', 
    13, NULL, 14, '2023-12-20 05:43:35'
  ), 
  (
    41, 'This is a Comment about Fashion', 
    13, NULL, 16, '2023-12-21 10:29:33'
  ), 
  (
    42, 'This is a Comment about Fashion', 
    17, NULL, 13, '2023-12-08 05:36:11'
  ), 
  (
    43, 'This is a Comment about Fashion', 
    17, NULL, 14, '2023-12-19 10:56:40'
  ), 
  (
    44, 'This is a Comment about Fashion', 
    17, NULL, 15, '2023-12-19 17:05:56'
  ), 
  (
    45, 'This is a Comment about Food', 
    3, NULL, 18, '2023-12-20 07:38:22'
  ), 
  (
    46, 'This is a Comment about Food', 
    3, NULL, 19, '2023-12-20 15:00:22'
  ), 
  (
    47, 'This is a Comment about Food', 
    3, NULL, 20, '2023-12-16 11:24:40'
  ), 
  (
    48, 'This is a Comment about Food', 
    7, NULL, 17, '2023-12-21 15:19:59'
  ), 
  (
    49, 'This is a Comment about Food', 
    7, NULL, 19, '2023-12-20 20:23:03'
  ), 
  (
    50, 'This is a Comment about Food', 
    7, NULL, 20, '2023-12-19 09:38:07'
  ), 
  (
    51, 'This is a Comment about Food', 
    11, NULL, 17, '2023-12-20 23:13:08'
  ), 
  (
    52, 'This is a Comment about Food', 
    11, NULL, 18, '2023-12-17 17:29:12'
  ), 
  (
    53, 'This is a Comment about Food', 
    11, NULL, 20, '2023-12-15 20:16:43'
  ), 
  (
    54, 'This is a Comment about Food', 
    12, NULL, 17, '2023-12-21 14:28:25'
  ), 
  (
    55, 'This is a Comment about Food', 
    12, NULL, 18, '2023-12-11 06:14:43'
  ), 
  (
    56, 'This is a Comment about Food', 
    12, NULL, 19, '2023-12-21 14:06:36'
  ), 
  (
    57, 'This is a Comment about Gaming', 
    5, NULL, 22, '2023-12-17 13:36:05'
  ), 
  (
    58, 'This is a Comment about Gaming', 
    5, NULL, 23, '2023-12-19 09:30:41'
  ), 
  (
    59, 'This is a Comment about Gaming', 
    11, NULL, 21, '2023-12-21 02:02:57'
  ), 
  (
    60, 'This is a Comment about Gaming', 
    11, NULL, 23, '2023-12-14 02:13:37'
  ), 
  (
    61, 'This is a Comment about Gaming', 
    16, NULL, 21, '2023-12-21 04:48:22'
  ), 
  (
    62, 'This is a Comment about Gaming', 
    16, NULL, 22, '2023-12-19 19:15:19'
  ), 
  (
    63, 'This is a Comment about Movies', 
    1, NULL, 25, '2023-12-18 14:33:43'
  ), 
  (
    64, 'This is a Comment about Movies', 
    1, NULL, 26, '2023-12-06 13:52:00'
  ), 
  (
    65, 'This is a Comment about Movies', 
    1, NULL, 27, '2023-12-20 12:59:08'
  ), 
  (
    66, 'This is a Comment about Movies', 
    2, NULL, 24, '2023-12-18 16:27:46'
  ), 
  (
    67, 'This is a Comment about Movies', 
    2, NULL, 26, '2023-11-30 09:30:44'
  ), 
  (
    68, 'This is a Comment about Movies', 
    2, NULL, 27, '2023-12-20 06:24:25'
  ), 
  (
    69, 'This is a Comment about Movies', 
    4, NULL, 24, '2023-12-19 12:07:33'
  ), 
  (
    70, 'This is a Comment about Movies', 
    4, NULL, 25, '2023-12-21 00:42:02'
  ), 
  (
    71, 'This is a Comment about Movies', 
    4, NULL, 27, '2023-12-19 20:47:20'
  ), 
  (
    72, 'This is a Comment about Movies', 
    8, NULL, 24, '2023-12-15 17:08:14'
  ), 
  (
    73, 'This is a Comment about Movies', 
    8, NULL, 25, '2023-12-19 11:00:29'
  ), 
  (
    74, 'This is a Comment about Movies', 
    8, NULL, 26, '2023-12-06 10:56:00'
  ), 
  (
    75, 'This is a Comment about Music', 
    1, NULL, 29, '2023-12-20 21:08:39'
  ), 
  (
    76, 'This is a Comment about Music', 
    1, NULL, 30, '2023-12-16 14:16:30'
  ), 
  (
    77, 'This is a Comment about Music', 
    7, NULL, 28, '2023-12-13 06:21:44'
  ), 
  (
    78, 'This is a Comment about Music', 
    7, NULL, 30, '2023-12-18 00:32:39'
  ), 
  (
    79, 'This is a Comment about Music', 
    10, NULL, 28, '2023-12-07 14:56:13'
  ), 
  (
    80, 'This is a Comment about Music', 
    10, NULL, 29, '2023-12-19 12:14:54'
  ), 
  (
    81, 'This is a Comment about Programming', 
    5, NULL, 32, '2023-12-20 16:14:14'
  ), 
  (
    82, 'This is a Comment about Programming', 
    13, NULL, 31, '2023-12-19 23:42:10'
  ), 
  (
    83, 'This is a Comment about Science', 
    1, NULL, 34, '2023-12-13 01:35:02'
  ), 
  (
    84, 'This is a Comment about Science', 
    1, NULL, 35, '2023-12-21 13:46:52'
  ), 
  (
    85, 'This is a Comment about Science', 
    1, NULL, 36, '2023-12-20 03:27:29'
  ), 
  (
    86, 'This is a Comment about Science', 
    1, NULL, 37, '2023-12-20 09:16:57'
  ), 
  (
    87, 'This is a Comment about Science', 
    1, NULL, 38, '2023-12-15 16:36:53'
  ), 
  (
    88, 'This is a Comment about Science', 
    4, NULL, 33, '2023-12-20 02:34:40'
  ), 
  (
    89, 'This is a Comment about Science', 
    4, NULL, 35, '2023-12-21 07:20:56'
  ), 
  (
    90, 'This is a Comment about Science', 
    4, NULL, 36, '2023-12-08 04:23:07'
  ), 
  (
    91, 'This is a Comment about Science', 
    4, NULL, 37, '2023-12-21 02:22:10'
  ), 
  (
    92, 'This is a Comment about Science', 
    4, NULL, 38, '2023-12-15 22:24:57'
  ), 
  (
    93, 'This is a Comment about Science', 
    8, NULL, 33, '2023-12-19 23:11:05'
  ), 
  (
    94, 'This is a Comment about Science', 
    8, NULL, 34, '2023-12-09 19:33:53'
  ), 
  (
    95, 'This is a Comment about Science', 
    8, NULL, 36, '2023-12-19 15:43:41'
  ), 
  (
    96, 'This is a Comment about Science', 
    8, NULL, 37, '2023-12-20 21:07:02'
  ), 
  (
    97, 'This is a Comment about Science', 
    8, NULL, 38, '2023-12-16 05:34:37'
  ), 
  (
    98, 'This is a Comment about Science', 
    10, NULL, 33, '2023-12-20 22:20:34'
  ), 
  (
    99, 'This is a Comment about Science', 
    10, NULL, 34, '2023-12-14 02:22:51'
  ), 
  (
    100, 'This is a Comment about Science', 
    10, NULL, 35, '2023-12-20 13:29:01'
  ), 
  (
    101, 'This is a Comment about Science', 
    10, NULL, 37, '2023-12-21 05:46:32'
  ), 
  (
    102, 'This is a Comment about Science', 
    10, NULL, 38, '2023-12-18 11:15:59'
  ), 
  (
    103, 'This is a Comment about Science', 
    13, NULL, 33, '2023-12-21 00:24:28'
  ), 
  (
    104, 'This is a Comment about Science', 
    13, NULL, 34, '2023-12-08 19:11:23'
  ), 
  (
    105, 'This is a Comment about Science', 
    13, NULL, 35, '2023-12-20 20:38:26'
  ), 
  (
    106, 'This is a Comment about Science', 
    13, NULL, 36, '2023-12-16 17:30:40'
  ), 
  (
    107, 'This is a Comment about Science', 
    13, NULL, 38, '2023-12-21 13:54:17'
  ), 
  (
    108, 'This is a Comment about Science', 
    17, NULL, 33, '2023-12-20 23:36:11'
  ), 
  (
    109, 'This is a Comment about Science', 
    17, NULL, 34, '2023-12-07 18:29:38'
  ), 
  (
    110, 'This is a Comment about Science', 
    17, NULL, 35, '2023-12-20 16:39:55'
  ), 
  (
    111, 'This is a Comment about Science', 
    17, NULL, 36, '2023-12-16 06:04:48'
  ), 
  (
    112, 'This is a Comment about Science', 
    17, NULL, 37, '2023-12-21 08:27:48'
  ), 
  (
    113, 'This is a Comment about Sports', 
    10, NULL, 40, '2023-12-17 20:18:45'
  ), 
  (
    114, 'This is a Comment about Sports', 
    10, NULL, 41, '2023-12-19 11:32:13'
  ), 
  (
    115, 'This is a Comment about Sports', 
    15, NULL, 39, '2023-12-21 14:17:50'
  ), 
  (
    116, 'This is a Comment about Sports', 
    15, NULL, 41, '2023-12-19 19:15:55'
  ), 
  (
    117, 'This is a Comment about Sports', 
    16, NULL, 39, '2023-12-11 14:20:21'
  ), 
  (
    118, 'This is a Comment about Sports', 
    16, NULL, 40, '2023-12-20 19:45:09'
  ), 
  (
    119, 'This is a Comment about Television', 
    7, NULL, 43, '2023-12-16 03:54:20'
  ), 
  (
    120, 'This is a Comment about Television', 
    7, NULL, 44, '2023-12-12 12:39:48'
  ), 
  (
    121, 'This is a Comment about Television', 
    7, NULL, 45, '2023-12-20 22:30:24'
  ), 
  (
    122, 'This is a Comment about Television', 
    14, NULL, 42, '2023-12-20 08:02:33'
  ), 
  (
    123, 'This is a Comment about Television', 
    14, NULL, 44, '2023-12-19 14:00:41'
  ), 
  (
    124, 'This is a Comment about Television', 
    14, NULL, 45, '2023-12-10 01:27:32'
  ), 
  (
    125, 'This is a Comment about Television', 
    15, NULL, 42, '2023-12-18 22:28:14'
  ), 
  (
    126, 'This is a Comment about Television', 
    15, NULL, 43, '2023-12-11 05:46:45'
  ), 
  (
    127, 'This is a Comment about Television', 
    15, NULL, 45, '2023-12-10 11:04:38'
  ), 
  (
    128, 'This is a Comment about Television', 
    16, NULL, 42, '2023-12-17 04:49:52'
  ), 
  (
    129, 'This is a Comment about Television', 
    16, NULL, 43, '2023-12-05 00:53:07'
  ), 
  (
    130, 'This is a Comment about Television', 
    16, NULL, 44, '2023-12-16 09:21:40'
  ), 
  (
    131, 'This is a Comment about Travel', 
    11, NULL, 47, '2023-12-16 16:29:12'
  ), 
  (
    132, 'This is a Comment about Travel', 
    11, NULL, 48, '2023-12-21 09:59:33'
  ), 
  (
    133, 'This is a Comment about Travel', 
    12, NULL, 46, '2023-12-21 08:17:33'
  ), 
  (
    134, 'This is a Comment about Travel', 
    12, NULL, 48, '2023-12-21 06:19:35'
  ), 
  (
    135, 'This is a Comment about Travel', 
    13, NULL, 46, '2023-12-21 14:30:49'
  ), 
  (
    136, 'This is a Comment about Travel', 
    13, NULL, 47, '2023-12-17 10:59:39'
  ), 
  (
    137, 'This is a Comment about Other', 
    7, NULL, 50, '2023-12-19 12:25:51'
  ), 
  (
    138, 'This is a Comment about Other', 
    7, NULL, 51, '2023-12-16 10:03:03'
  ), 
  (
    139, 'This is a Comment about Other', 
    11, NULL, 49, '2023-12-16 02:41:29'
  ), 
  (
    140, 'This is a Comment about Other', 
    11, NULL, 51, '2023-12-14 08:24:32'
  ), 
  (
    141, 'This is a Comment about Other', 
    15, NULL, 49, '2023-12-12 04:06:19'
  ), 
  (
    142, 'This is a Comment about Other', 
    15, NULL, 50, '2023-12-20 06:43:38'
  ), 
  (
    143, 'Thanks for Commenting!', 1, 36, 
    13, '2023-12-19 03:55:58'
  ), 
  (
    144, 'Thanks for Commenting!', 1, 39, 
    13, '2023-12-12 04:37:41'
  ), 
  (
    145, 'Thanks for Commenting!', 1, 42, 
    13, '2023-12-09 03:12:28'
  ), 
  (
    146, 'Thanks for Commenting!', 1, 66, 
    24, '2023-12-20 04:42:56'
  ), 
  (
    147, 'Thanks for Commenting!', 1, 69, 
    24, '2023-12-21 07:36:58'
  ), 
  (
    148, 'Thanks for Commenting!', 1, 72, 
    24, '2023-12-16 14:25:18'
  ), 
  (
    149, 'Thanks for Commenting!', 1, 77, 
    28, '2023-12-14 21:28:36'
  ), 
  (
    150, 'Thanks for Commenting!', 1, 79, 
    28, '2023-12-07 15:54:20'
  ), 
  (
    151, 'Thanks for Commenting!', 1, 88, 
    33, '2023-12-21 05:14:48'
  ), 
  (
    152, 'Thanks for Commenting!', 1, 93, 
    33, '2023-12-20 01:34:24'
  ), 
  (
    153, 'Thanks for Commenting!', 1, 98, 
    33, '2023-12-21 13:22:16'
  ), 
  (
    154, 'Thanks for Commenting!', 1, 103, 
    33, '2023-12-21 15:12:14'
  ), 
  (
    155, 'Thanks for Commenting!', 1, 108, 
    33, '2023-12-21 09:23:15'
  ), 
  (
    156, 'Thanks for Commenting!', 2, 17, 
    7, '2023-12-21 09:45:52'
  ), 
  (
    157, 'Thanks for Commenting!', 2, 21, 
    7, '2023-12-21 08:24:35'
  ), 
  (
    158, 'Thanks for Commenting!', 2, 25, 
    7, '2023-12-21 14:14:35'
  ), 
  (
    159, 'Thanks for Commenting!', 2, 29, 
    7, '2023-12-21 13:02:50'
  ), 
  (
    160, 'Thanks for Commenting!', 2, 63, 
    25, '2023-12-18 15:21:36'
  ), 
  (
    161, 'Thanks for Commenting!', 2, 70, 
    25, '2023-12-21 11:36:19'
  ), 
  (
    162, 'Thanks for Commenting!', 2, 73, 
    25, '2023-12-20 00:54:38'
  ), 
  (
    163, 'Thanks for Commenting!', 3, 48, 
    17, '2023-12-21 15:33:05'
  ), 
  (
    164, 'Thanks for Commenting!', 3, 51, 
    17, '2023-12-21 11:46:56'
  ), 
  (
    165, 'Thanks for Commenting!', 3, 54, 
    17, '2023-12-21 15:09:05'
  ), 
  (
    166, 'Thanks for Commenting!', 4, 64, 
    26, '2023-12-13 04:30:04'
  ), 
  (
    167, 'Thanks for Commenting!', 4, 67, 
    26, '2023-12-06 10:15:57'
  ), 
  (
    168, 'Thanks for Commenting!', 4, 74, 
    26, '2023-12-11 18:23:49'
  ), 
  (
    169, 'Thanks for Commenting!', 4, 83, 
    34, '2023-12-18 07:17:50'
  ), 
  (
    170, 'Thanks for Commenting!', 4, 94, 
    34, '2023-12-15 23:52:48'
  ), 
  (
    171, 'Thanks for Commenting!', 4, 99, 
    34, '2023-12-14 21:08:32'
  ), 
  (
    172, 'Thanks for Commenting!', 4, 104, 
    34, '2023-12-15 01:28:47'
  ), 
  (
    173, 'Thanks for Commenting!', 4, 109, 
    34, '2023-12-09 10:17:33'
  ), 
  (
    174, 'Thanks for Commenting!', 5, 59, 
    21, '2023-12-21 04:31:56'
  ), 
  (
    175, 'Thanks for Commenting!', 5, 61, 
    21, '2023-12-21 13:05:03'
  ), 
  (
    176, 'Thanks for Commenting!', 5, 82, 
    31, '2023-12-20 21:31:04'
  ), 
  (
    177, 'Thanks for Commenting!', 6, 9, 
    4, '2023-12-21 13:37:29'
  ), 
  (
    178, 'Thanks for Commenting!', 6, 11, 
    4, '2023-12-21 05:31:53'
  ), 
  (
    179, 'Thanks for Commenting!', 6, 13, 
    8, '2023-12-19 15:32:47'
  ), 
  (
    180, 'Thanks for Commenting!', 6, 22, 
    8, '2023-12-19 21:48:55'
  ), 
  (
    181, 'Thanks for Commenting!', 6, 26, 
    8, '2023-12-21 00:18:38'
  ), 
  (
    182, 'Thanks for Commenting!', 6, 30, 
    8, '2023-12-20 01:22:14'
  ), 
  (
    183, 'Thanks for Commenting!', 7, 45, 
    18, '2023-12-20 18:09:39'
  ), 
  (
    184, 'Thanks for Commenting!', 7, 52, 
    18, '2023-12-21 11:31:55'
  ), 
  (
    185, 'Thanks for Commenting!', 7, 55, 
    18, '2023-12-13 21:05:07'
  ), 
  (
    186, 'Thanks for Commenting!', 7, 75, 
    29, '2023-12-21 14:56:22'
  ), 
  (
    187, 'Thanks for Commenting!', 7, 80, 
    29, '2023-12-19 16:10:59'
  ), 
  (
    188, 'Thanks for Commenting!', 7, 122, 
    42, '2023-12-20 09:10:13'
  ), 
  (
    189, 'Thanks for Commenting!', 7, 125, 
    42, '2023-12-21 10:03:09'
  ), 
  (
    190, 'Thanks for Commenting!', 7, 128, 
    42, '2023-12-19 09:35:31'
  ), 
  (
    191, 'Thanks for Commenting!', 7, 139, 
    49, '2023-12-19 09:16:55'
  ), 
  (
    192, 'Thanks for Commenting!', 7, 141, 
    49, '2023-12-19 05:03:04'
  ), 
  (
    193, 'Thanks for Commenting!', 8, 7, 
    5, '2023-12-21 15:57:33'
  ), 
  (
    194, 'Thanks for Commenting!', 8, 12, 
    5, '2023-12-21 14:49:58'
  ), 
  (
    195, 'Thanks for Commenting!', 8, 33, 
    14, '2023-12-20 20:01:46'
  ), 
  (
    196, 'Thanks for Commenting!', 8, 40, 
    14, '2023-12-20 19:21:38'
  ), 
  (
    197, 'Thanks for Commenting!', 8, 43, 
    14, '2023-12-19 23:56:13'
  ), 
  (
    198, 'Thanks for Commenting!', 8, 65, 
    27, '2023-12-21 12:47:20'
  ), 
  (
    199, 'Thanks for Commenting!', 8, 68, 
    27, '2023-12-20 14:28:24'
  ), 
  (
    200, 'Thanks for Commenting!', 8, 71, 
    27, '2023-12-20 10:04:35'
  ), 
  (
    201, 'Thanks for Commenting!', 8, 84, 
    35, '2023-12-21 15:55:23'
  ), 
  (
    202, 'Thanks for Commenting!', 8, 89, 
    35, '2023-12-21 10:08:43'
  ), 
  (
    203, 'Thanks for Commenting!', 8, 100, 
    35, '2023-12-21 03:57:17'
  ), 
  (
    204, 'Thanks for Commenting!', 8, 105, 
    35, '2023-12-21 08:31:21'
  ), 
  (
    205, 'Thanks for Commenting!', 8, 110, 
    35, '2023-12-21 09:42:35'
  ), 
  (
    206, 'Thanks for Commenting!', 9, 8, 
    6, '2023-12-21 09:59:27'
  ), 
  (
    207, 'Thanks for Commenting!', 9, 10, 
    6, '2023-12-21 13:46:32'
  ), 
  (
    208, 'Thanks for Commenting!', 9, 14, 
    9, '2023-12-21 03:04:03'
  ), 
  (
    209, 'Thanks for Commenting!', 9, 18, 
    9, '2023-12-21 15:47:53'
  ), 
  (
    210, 'Thanks for Commenting!', 9, 27, 
    9, '2023-12-21 11:58:55'
  ), 
  (
    211, 'Thanks for Commenting!', 9, 31, 
    9, '2023-12-21 12:59:53'
  ), 
  (
    212, 'Thanks for Commenting!', 10, 3, 
    1, '2023-12-21 13:57:33'
  ), 
  (
    213, 'Thanks for Commenting!', 10, 5, 
    1, '2023-12-19 19:22:36'
  ), 
  (
    214, 'Thanks for Commenting!', 10, 76, 
    30, '2023-12-19 20:19:29'
  ), 
  (
    215, 'Thanks for Commenting!', 10, 78, 
    30, '2023-12-20 21:09:40'
  ), 
  (
    216, 'Thanks for Commenting!', 10, 85, 
    36, '2023-12-21 10:58:51'
  ), 
  (
    217, 'Thanks for Commenting!', 10, 90, 
    36, '2023-12-15 22:30:27'
  ), 
  (
    218, 'Thanks for Commenting!', 10, 95, 
    36, '2023-12-21 03:38:49'
  ), 
  (
    219, 'Thanks for Commenting!', 10, 106, 
    36, '2023-12-18 23:47:00'
  ), 
  (
    220, 'Thanks for Commenting!', 10, 111, 
    36, '2023-12-16 13:04:36'
  ), 
  (
    221, 'Thanks for Commenting!', 10, 115, 
    39, '2023-12-21 15:37:32'
  ), 
  (
    222, 'Thanks for Commenting!', 10, 117, 
    39, '2023-12-18 00:31:47'
  ), 
  (
    223, 'Thanks for Commenting!', 11, 46, 
    19, '2023-12-21 03:55:06'
  ), 
  (
    224, 'Thanks for Commenting!', 11, 49, 
    19, '2023-12-21 00:23:27'
  ), 
  (
    225, 'Thanks for Commenting!', 11, 56, 
    19, '2023-12-21 14:27:53'
  ), 
  (
    226, 'Thanks for Commenting!', 11, 57, 
    22, '2023-12-18 08:50:39'
  ), 
  (
    227, 'Thanks for Commenting!', 11, 62, 
    22, '2023-12-20 13:28:58'
  ), 
  (
    228, 'Thanks for Commenting!', 11, 133, 
    46, '2023-12-21 10:46:56'
  ), 
  (
    229, 'Thanks for Commenting!', 11, 135, 
    46, '2023-12-21 14:59:21'
  ), 
  (
    230, 'Thanks for Commenting!', 11, 137, 
    50, '2023-12-19 18:42:19'
  ), 
  (
    231, 'Thanks for Commenting!', 11, 142, 
    50, '2023-12-21 15:05:02'
  ), 
  (
    232, 'Thanks for Commenting!', 12, 1, 
    2, '2023-12-20 21:18:49'
  ), 
  (
    233, 'Thanks for Commenting!', 12, 6, 
    2, '2023-12-21 08:04:19'
  ), 
  (
    234, 'Thanks for Commenting!', 12, 47, 
    20, '2023-12-17 07:46:12'
  ), 
  (
    235, 'Thanks for Commenting!', 12, 50, 
    20, '2023-12-21 08:47:06'
  ), 
  (
    236, 'Thanks for Commenting!', 12, 53, 
    20, '2023-12-17 05:28:53'
  ), 
  (
    237, 'Thanks for Commenting!', 12, 131, 
    47, '2023-12-18 21:33:34'
  ), 
  (
    238, 'Thanks for Commenting!', 12, 136, 
    47, '2023-12-19 01:10:54'
  ), 
  (
    239, 'Thanks for Commenting!', 13, 34, 
    15, '2023-12-20 18:20:46'
  ), 
  (
    240, 'Thanks for Commenting!', 13, 37, 
    15, '2023-12-21 13:50:31'
  ), 
  (
    241, 'Thanks for Commenting!', 13, 44, 
    15, '2023-12-21 09:51:58'
  ), 
  (
    242, 'Thanks for Commenting!', 13, 81, 
    32, '2023-12-20 22:57:22'
  ), 
  (
    243, 'Thanks for Commenting!', 13, 86, 
    37, '2023-12-21 09:11:47'
  ), 
  (
    244, 'Thanks for Commenting!', 13, 91, 
    37, '2023-12-21 12:00:06'
  ), 
  (
    245, 'Thanks for Commenting!', 13, 96, 
    37, '2023-12-20 21:38:00'
  ), 
  (
    246, 'Thanks for Commenting!', 13, 101, 
    37, '2023-12-21 14:56:04'
  ), 
  (
    247, 'Thanks for Commenting!', 13, 112, 
    37, '2023-12-21 14:18:14'
  ), 
  (
    248, 'Thanks for Commenting!', 13, 132, 
    48, '2023-12-21 10:20:54'
  ), 
  (
    249, 'Thanks for Commenting!', 13, 134, 
    48, '2023-12-21 06:22:52'
  ), 
  (
    250, 'Thanks for Commenting!', 14, 119, 
    43, '2023-12-18 05:28:10'
  ), 
  (
    251, 'Thanks for Commenting!', 14, 126, 
    43, '2023-12-16 19:51:30'
  ), 
  (
    252, 'Thanks for Commenting!', 14, 129, 
    43, '2023-12-13 05:30:10'
  ), 
  (
    253, 'Thanks for Commenting!', 15, 15, 
    10, '2023-12-21 14:44:56'
  ), 
  (
    254, 'Thanks for Commenting!', 15, 19, 
    10, '2023-12-20 22:01:03'
  ), 
  (
    255, 'Thanks for Commenting!', 15, 23, 
    10, '2023-12-21 13:02:54'
  ), 
  (
    256, 'Thanks for Commenting!', 15, 32, 
    10, '2023-12-21 04:55:51'
  ), 
  (
    257, 'Thanks for Commenting!', 15, 113, 
    40, '2023-12-18 20:28:12'
  ), 
  (
    258, 'Thanks for Commenting!', 15, 118, 
    40, '2023-12-21 14:08:34'
  ), 
  (
    259, 'Thanks for Commenting!', 15, 120, 
    44, '2023-12-21 00:01:22'
  ), 
  (
    260, 'Thanks for Commenting!', 15, 123, 
    44, '2023-12-19 22:28:12'
  ), 
  (
    261, 'Thanks for Commenting!', 15, 130, 
    44, '2023-12-18 05:50:20'
  ), 
  (
    262, 'Thanks for Commenting!', 15, 138, 
    51, '2023-12-19 11:47:42'
  ), 
  (
    263, 'Thanks for Commenting!', 15, 140, 
    51, '2023-12-16 07:31:32'
  ), 
  (
    264, 'Thanks for Commenting!', 16, 16, 
    11, '2023-12-20 16:57:51'
  ), 
  (
    265, 'Thanks for Commenting!', 16, 20, 
    11, '2023-12-12 23:33:13'
  ), 
  (
    266, 'Thanks for Commenting!', 16, 24, 
    11, '2023-12-18 14:30:01'
  ), 
  (
    267, 'Thanks for Commenting!', 16, 28, 
    11, '2023-12-17 20:35:11'
  ), 
  (
    268, 'Thanks for Commenting!', 16, 58, 
    23, '2023-12-21 12:55:01'
  ), 
  (
    269, 'Thanks for Commenting!', 16, 60, 
    23, '2023-12-19 19:32:12'
  ), 
  (
    270, 'Thanks for Commenting!', 16, 114, 
    41, '2023-12-21 05:54:11'
  ), 
  (
    271, 'Thanks for Commenting!', 16, 116, 
    41, '2023-12-20 04:05:49'
  ), 
  (
    272, 'Thanks for Commenting!', 16, 121, 
    45, '2023-12-21 11:15:07'
  ), 
  (
    273, 'Thanks for Commenting!', 16, 124, 
    45, '2023-12-21 12:09:39'
  ), 
  (
    274, 'Thanks for Commenting!', 16, 127, 
    45, '2023-12-10 14:59:06'
  ), 
  (
    275, 'Thanks for Commenting!', 17, 2, 
    3, '2023-12-21 10:05:53'
  ), 
  (
    276, 'Thanks for Commenting!', 17, 4, 
    3, '2023-12-19 19:26:07'
  ), 
  (
    277, 'Thanks for Commenting!', 17, 35, 
    16, '2023-12-20 14:36:02'
  ), 
  (
    278, 'Thanks for Commenting!', 17, 38, 
    16, '2023-12-21 06:34:55'
  ), 
  (
    279, 'Thanks for Commenting!', 17, 41, 
    16, '2023-12-21 13:44:13'
  ), 
  (
    280, 'Thanks for Commenting!', 17, 87, 
    38, '2023-12-19 02:04:59'
  ), 
  (
    281, 'Thanks for Commenting!', 17, 92, 
    38, '2023-12-21 06:49:21'
  ), 
  (
    282, 'Thanks for Commenting!', 17, 97, 
    38, '2023-12-18 01:33:05'
  ), 
  (
    283, 'Thanks for Commenting!', 17, 102, 
    38, '2023-12-19 09:01:26'
  ), 
  (
    284, 'Thanks for Commenting!', 17, 107, 
    38, '2023-12-21 15:30:18'
  );

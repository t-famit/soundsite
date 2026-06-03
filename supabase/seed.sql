-- Seed users
insert into public.users (id, clerk_id, username, display_name, avatar_url) values
  ('00000000-0000-0000-0000-000000000001', 'user_seed_1', 'alice', 'Alice', null),
  ('00000000-0000-0000-0000-000000000002', 'user_seed_2', 'bob', 'Bob', null),
  ('00000000-0000-0000-0000-000000000003', 'user_seed_3', 'carol', 'Carol', null);

-- Seed tracks
insert into public.tracks (id, user_id, title, genre, audio_url, artwork_url, duration_seconds, play_count) values
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Morning Light', 'Ambient', 'https://example.com/audio/1.mp3', null, 187, 42),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'City Pulse', 'Electronic', 'https://example.com/audio/2.mp3', null, 243, 18),
  ('10000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000003', 'Quiet Storm', 'Jazz', 'https://example.com/audio/3.mp3', null, 312, 7),
  ('10000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000001', 'Late Drive', 'Lo-fi', 'https://example.com/audio/4.mp3', null, 198, 93),
  ('10000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000002', 'Open Field', 'Folk', 'https://example.com/audio/5.mp3', null, 224, 31);

-- Seed follows
insert into public.follows (follower_id, following_id) values
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000003'),
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001');

-- Seed likes
insert into public.likes (user_id, track_id) values
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002'),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000001'),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000004');
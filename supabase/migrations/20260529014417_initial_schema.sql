-- Users
create table public.users (
  id uuid primary key default gen_random_uuid(),
  clerk_id text unique not null,
  username text unique not null,
  display_name text,
  avatar_url text,
  created_at timestamp with time zone default now()
);

-- Tracks
create table public.tracks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.users(id) on delete cascade not null,
  title text not null,
  genre text,
  audio_url text not null,
  artwork_url text,
  waveform_data jsonb,
  duration_seconds integer,
  play_count integer default 0,
  created_at timestamp with time zone default now()
);

-- Follows
create table public.follows (
  follower_id uuid references public.users(id) on delete cascade not null,
  following_id uuid references public.users(id) on delete cascade not null,
  created_at timestamp with time zone default now(),
  primary key (follower_id, following_id)
);

-- Likes
create table public.likes (
  user_id uuid references public.users(id) on delete cascade not null,
  track_id uuid references public.tracks(id) on delete cascade not null,
  created_at timestamp with time zone default now(),
  primary key (user_id, track_id)
);

-- Comments
create table public.comments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.users(id) on delete cascade not null,
  track_id uuid references public.tracks(id) on delete cascade not null,
  body text not null,
  timestamp_seconds integer,
  created_at timestamp with time zone default now()
);

-- Playlists
create table public.playlists (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.users(id) on delete cascade not null,
  title text not null,
  created_at timestamp with time zone default now()
);

-- Playlist tracks
create table public.playlist_tracks (
  playlist_id uuid references public.playlists(id) on delete cascade not null,
  track_id uuid references public.tracks(id) on delete cascade not null,
  position integer not null,
  primary key (playlist_id, track_id)
);
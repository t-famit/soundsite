import { supabase } from '@/lib/supabase'
import { SignInButton, UserButton, Show } from '@clerk/nextjs'

type Track = {
  id: string
  title: string
  genre: string | null
  duration_seconds: number | null
  play_count: number
  created_at: string
  users: {
    username: string
    display_name: string | null
  } | null
}

async function getTracks(): Promise<Track[]> {
  const { data, error } = await supabase
    .from('tracks')
    .select(`
      id,
      title,
      genre,
      duration_seconds,
      play_count,
      created_at,
      users!tracks_user_id_fkey (
        username,
        display_name
      )
    `)
    .order('created_at', { ascending: false })

  if (error) {
    console.error('Supabase error:', JSON.stringify(error))    
    return []
  }

  return data as Track[]
}

function formatDuration(seconds: number | null): string {
  if (!seconds) return '0:00'
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${m}:${s.toString().padStart(2, '0')}`
}

export default async function Home() {
  const tracks = await getTracks()

  return (
    <main className="min-h-screen bg-zinc-950 text-zinc-100 flex flex-col">
      <nav className="flex items-center justify-between px-8 py-5 border-b border-zinc-800">
        <span className="text-lg font-semibold tracking-tight">soundsite</span>
        <div className="flex items-center gap-4 text-sm text-zinc-400">
          <a href="/explore" className="hover:text-zinc-100 transition-colors">explore</a>
          <a href="/upload" className="hover:text-zinc-100 transition-colors">upload</a>
          <SignInButton mode="modal">
            <button className="hover:text-zinc-100 transition-colors">sign in</button>
          </SignInButton>
          <Show when="signedIn">
            <UserButton />
          </Show>
        </div>
      </nav>
      <div className="max-w-2xl mx-auto w-full px-4 py-10">
        <h2 className="text-sm font-medium text-zinc-500 uppercase tracking-widest mb-6">recent uploads</h2>
        <div className="flex flex-col gap-3">
          {tracks.map(track => (
            <div key={track.id} className="flex items-center justify-between bg-zinc-900 rounded-lg px-5 py-4 hover:bg-zinc-800 transition-colors cursor-pointer">
              <div className="flex flex-col gap-1">
                <span className="text-sm font-medium text-zinc-100">{track.title}</span>
                <span className="text-xs text-zinc-500">
                  {track.users?.display_name || track.users?.username} {track.genre ? `· ${track.genre}` : ''}
                </span>
              </div>
              <div className="flex items-center gap-4 text-xs text-zinc-500">
                <span>{formatDuration(track.duration_seconds)}</span>
                <span>{track.play_count} plays</span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </main>
  )
}
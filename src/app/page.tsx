export default function Home() {
  return (
    <main className="min-h-screen bg-zinc-950 text-zinc-100 flex flex-col">
      <nav className="flex items-center justify-between px-8 py-5 border-b border-zinc-800">
        <span className="text-lg font-semibold tracking-tight">soundsite</span>
        <div className="flex items-center gap-4 text-sm text-zinc-400">
          <a href="/explore" className="hover:text-zinc-100 transition-colors">explore</a>
          <a href="/upload" className="hover:text-zinc-100 transition-colors">upload</a>
          <a href="/sign-in" className="hover:text-zinc-100 transition-colors">sign in</a>
        </div>
      </nav>
      <div className="flex flex-1 items-center justify-center">
        <div className="text-center">
          <h1 className="text-5xl font-semibold tracking-tight mb-4">
            a place for music
          </h1>
          <p className="text-zinc-400 text-lg mb-8">
            upload, share, and discover music
          </p>
          
            <a href="/explore" className="inline-block bg-white text-zinc-950 px-6 py-3 rounded-full text-sm font-medium hover:bg-zinc-200 transition-colors">
              start exploring
            </a>
        </div>
      </div>
    </main>
  )
}
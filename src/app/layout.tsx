import type { Metadata } from "next";
import localFont from "next/font/local";
import "./globals.css";

const sans = localFont({
  src: "../fonts/GeistVF.woff2",
  variable: "--font-sans",
  display: "swap",
});

const mono = localFont({
  src: "../fonts/GeistMonoVF.woff2",
  variable: "--font-mono",
  display: "swap",
});

export const metadata: Metadata = {
  title: "soundsite",
  description: "a place for music",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${sans.variable} ${mono.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
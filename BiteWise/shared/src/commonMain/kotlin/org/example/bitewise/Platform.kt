package org.example.bitewise

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
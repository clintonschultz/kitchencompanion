package com.example.kitchencompanion

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
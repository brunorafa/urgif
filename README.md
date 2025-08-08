<div align="center">

# 🎬 Urgif

**A modern GIF search and management application**

[![Elixir](https://img.shields.io/badge/elixir-1.15+-purple.svg)](https://elixir-lang.org)
[![Tauri](https://img.shields.io/badge/tauri-1.0+-blue.svg)](https://tauri.app)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](#)

*Fast, reliable, and user-friendly GIF discovery at your fingertips*

[Features](#-features) • [Quick Start](#-quick-start) • [Architecture](#-architecture) • [Contributing](#-contributing) • [License](#-license)

</div>

---

## ✨ Features

🔍 **Smart GIF Search** - Powered by advanced search algorithms  
⚡ **Lightning Fast** - Built with Elixir for high performance  
🖥️ **Cross-Platform** - Desktop app built with Tauri  
🎨 **Modern UI** - Clean and intuitive user interface  
📱 **Responsive Design** - Works seamlessly across different screen sizes  
🔧 **Extensible** - Modular architecture for easy customization  

## 🚀 Quick Start

### Prerequisites

- **Elixir** 1.15+ and **OTP** 26+
- **Rust** 1.70+
- **Node.js** 18+ (for Tauri frontend)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/urgif.git
   cd urgif
   ```

2. **Setup the backend (Elixir Core)**
   ```bash
   cd core
   mix deps.get
   mix compile
   ```

3. **Setup the frontend (Tauri UI)**
   ```bash
   cd ../ui
   npm install  # or yarn install
   ```

4. **Run the application**
   ```bash
   npm run tauri dev  # or yarn tauri dev
   ```

## 🏗️ Architecture

Urgif follows a modern microservices architecture:

```
├── core/          # Elixir backend service
│   ├── lib/       # Core business logic
│   ├── config/    # Application configuration
│   └── test/      # Test suites
└── ui/            # Tauri frontend application
    ├── src/       # Frontend source code
    └── src-tauri/ # Rust backend for Tauri
```

### Core Components

- **🔮 Core Service** - Elixir-based backend handling GIF search and management
- **🎨 UI Layer** - Tauri-based desktop application with modern web technologies
- **🔌 API Integration** - Seamless integration with popular GIF services

## 🛠️ Development

### Backend Development (Core)

```bash
cd core
mix deps.get
mix test
iex -S mix  # Interactive development
```

### Frontend Development (UI)

```bash
cd ui
npm run tauri dev     # Development mode
npm run tauri build   # Production build
```

### Running Tests

```bash
# Backend tests
cd core && mix test

# Frontend tests (when added)
cd ui && npm test
```

## 📦 Building for Production

### Desktop Application

```bash
cd ui
npm run tauri build
```

The built application will be available in `ui/src-tauri/target/release/`.

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'Add some amazing feature'`)
4. **Push to the branch** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### Development Guidelines

- Follow [Elixir Style Guide](https://github.com/christopheradams/elixir_style_guide) for backend code
- Use [Prettier](https://prettier.io/) for frontend code formatting
- Write tests for new features
- Update documentation as needed

## 📋 Roadmap

- [ ] 🔍 Advanced search filters
- [ ] 💾 Local GIF caching
- [ ] 🌐 Multiple provider support
- [ ] 📁 Custom collections
- [ ] 🔄 Sync across devices
- [ ] 🎯 Keyboard shortcuts

## 🐛 Known Issues

Currently tracking issues in our [GitHub Issues](https://github.com/yourusername/urgif/issues) page.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Elixir](https://elixir-lang.org/) for the powerful backend foundation
- [Tauri](https://tauri.app/) for enabling cross-platform desktop development
- [Tenor API](https://tenor.com/gifapi) for GIF content provider

---

<div align="center">

**Made with ❤️ by the Urgif Team**

[⭐ Star this project](https://github.com/yourusername/urgif) if you find it useful!

</div> 
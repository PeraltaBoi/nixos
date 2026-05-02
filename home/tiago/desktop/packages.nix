{ pkgs, ... }:

{

  home.packages = with pkgs; [
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    cliphist
    quickshell
    ungoogled-chromium
    fuzzel
    vlc
    vesktop
    pinta
    # gimp
    resources
    fractal
    # hypnotix
    ffmpeg
    fragments
    p7zip
    krunker
    kodi
    prismlauncher
    mangohud
    glfw
    spotify-player
    spotify
    xwayland-satellite
    zenity
    # stremio
    deluge
    blender
    mindustry-wayland
    qt6Packages.qt5compat
    cava
    vial
    reaper
    unzip
    guitarix

    dconf-editor
    polkit_gnome
    nwg-look
    pavucontrol
    adwsteamgtk
    overskride
    obs-studio
    audacity
    ardour
    cambalache
    yazi
    ouch
    unrar-free
    # rustdesk
    gamescope
    heroic
    javaPackages.compiler.openjdk25

    nitch

    ripgrep
    fzf
    fd
    dbeaver-bin
    cartero
    uv
    ty
    ruff
    opencode

    # dev tools
    lazygit
    jujutsu
    hoppscotch
    pkg-config

    # LSPs and such
    cargo
    rustc
    jdt-language-server
    bun
    nodejs_22
    dotnetCorePackages.dotnet_8.sdk
    dotnet-ef
    tailwindcss
    nixd
    nixfmt
    vscode-langservers-extracted
    tailwindcss-language-server
    typescript-language-server
    prettier
    oxfmt
    eslint
    oxlint
    tsgolint
    rust-analyzer
    rustfmt
    clippy
    protols
    omnisharp-roslyn
    csharp-ls
    netcoredbg
    maven
    docker-compose
    kdePackages.qtdeclarative
    haskellPackages.hakyll
    purescript
    spago
    steel
    kotlin-language-server
    python314
    lean4
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    cliphist
    ungoogled-chromium
    fuzzel
    vlc
    vesktop
    pinta
    # gimp
    resources
    fractal
    hypnotix
    ffmpeg
    fragments
    p7zip
    krunker
    kodi
    prismlauncher
    mangohud
    glfw
    spotify-player
    xwayland-satellite
    zenity
    stremio
    deluge
    blender
    mindustry-wayland

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

    nitch

    ripgrep
    fzf
    fd
    neofetch
    dbeaver-bin
    cartero

    # dev tools
    lazygit
    jujutsu
    hoppscotch

    # LSPs and such
    cargo
    rustc
    bun
    nodejs_22
    dotnetCorePackages.dotnet_8.sdk
    dotnet-ef
    tailwindcss
    nodePackages.prettier
    nixd
    nixfmt
    vscode-langservers-extracted
    tailwindcss-language-server
    typescript-language-server
    eslint
    rust-analyzer
    rustfmt
    clippy
    protols
    omnisharp-roslyn
    csharp-ls
    netcoredbg
    maven
    docker-compose
  ];
}

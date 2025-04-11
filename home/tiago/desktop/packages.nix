{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    ungoogled-chromium
    fuzzel
    vlc
    vesktop
    pinta
    resources
    fractal
    hypnotix
    ffmpeg
    fragments
    p7zip
    krunker
    kodi
    prismlauncher
    glfw
    spotify-player
    xwayland-satellite
    zenity

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
    jetbrains.rider

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

    # LSPs and such
    cargo
    rustc
    bun
    nodejs_23
    dotnetCorePackages.dotnet_8.sdk
    tailwindcss
    nodePackages.prettier
    nodePackages.vscode-json-languageserver
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
    netcoredbg
  ];
}

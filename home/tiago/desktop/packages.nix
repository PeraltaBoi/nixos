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
    gimp
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
    stremio
    deluge

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
    jetbrains.idea-community

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
    nodejs_22
    dotnetCorePackages.dotnet_8.sdk
    dotnet-ef
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
    csharp-ls
    netcoredbg
    jdk23
    maven
    docker-compose
  ];

  # Set environment variables to ensure .NET 8 is the default
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.dotnet_8.sdk}/share/dotnet";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };
}

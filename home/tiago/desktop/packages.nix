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

    nitch

    ripgrep
    fd
    neofetch
    dbeaver-bin
    cartero

    # development
    cargo
    rustc
    bun
    nodejs_23
    dotnetCorePackages.dotnet_8.sdk
    tailwindcss
    nodePackages.prettier
  ];
}

self: super: {
  roslyn-ls = super.roslyn-ls.overrideAttrs (old: {
    postPatch = ''
      # Override existing postPatch
      # Change SDK version requirement to 8.0
      cat > global.json << EOF
      {
        "sdk": {
          "version": "8.0.409",
          "rollForward": "latestMinor"
        }
      }
      EOF

      # Remove dotnet-format from dependencies
      sed -i '/dotnet-format/d' Directory.Packages.props
    '';

    nativeBuildInputs = (old.nativeBuildInputs or [ ])
      ++ [ self.dotnetCorePackages.sdk_8_0 ];
    buildInputs = [ self.dotnetCorePackages.sdk_8_0 ];
    runtimeDeps = [ self.dotnetCorePackages.sdk_8_0 ];

    preConfigure = ''
      export DOTNET_ROOT=${self.dotnetCorePackages.sdk_8_0}/share/dotnet
      export PATH=${self.dotnetCorePackages.sdk_8_0}/bin:$PATH
      export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
      export DOTNET_CLI_TELEMETRY_OPTOUT=1
    '';

    dotnetFlags = (old.dotnetFlags or [ ]) ++ [
      "-p:TargetFramework=net8.0"
      "--no-restore" # Skip restore step
    ];

    # Skip dotnet-format installation
    configurePhase = old.configurePhase or "" + ''
      if [[ -f NuGet.config ]]; then
        sed -i '/dotnet-format/d' NuGet.config
      fi
    '';
  });
}

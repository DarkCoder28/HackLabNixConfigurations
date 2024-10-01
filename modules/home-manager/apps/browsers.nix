{
  config,
  home,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # firefox
  ];
  programs = {
    firefox = {
      enable = true;
      policies = {
        BlockAboutAddons = false;
        BlockAboutConfig = false;
        BlockAboutProfiles = true;
        Bookmarks = {
          #
        };
        CaptivePortal = true;
        # Containers = {
        #   Google = {
        #     name = "Google";
        #     icon = ""
        #   };
        # };
        DefaultDownloadDirectory = "\${home}/Downloads";
        DisableMasterPasswordCreation = true;
        DisablePocket = true;
        DisableProfileImport = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            "installation_mode" = "force_installed";
            "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };
          "darkreader@darkreader.org" = {
            "installation_mode" = "force_installed";
            "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          };
          "bitwarden-password-manager@bitwarden.com" = {
            "installation_mode" = "force_installed";
            "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          };
          "duckduckgo-for-firefox@duckduckgo.com" = {
            "installation_mode" = "force_installed";
            "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
          };
        };
        FirefoxHome = {
          Search = true;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = false;
          Locked = true;
        };
        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
          Locked = true;
        };
        HardwareAcceleration = true;
        Homepage = {
          URL = "https://home.thesheerans.com";
          Locked = true;
          StartPage = "previous-session";
        };
        NewTabPage = true;
        OfferToSaveLogins = false;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        PasswordManagerEnabled = false;
        Preferences = {
          "widget.use-xdg-desktop-portal.file-picker" = {
            "Value" = true;
            "Status" = "locked";
          };
          "media.hardware-video-decoding.enabled" = {
            "Value" = true;
            "Status" = "locked";
          };
          "media.hardware-video-decoding.force-enabled" = {
            "Value" = true;
            "Status" = "locked";
          };
          "widget.wayland.fractional-scale.enabled" = {
            "Value" = true;
            "Status" = "locked";
          };
          "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = {
            "Value" = false;
            "Staus" = "locked";
          };
        };
        PromptForDownloadLocation = true;
        SearchBar = "unified";
        SearchEngines = {
          Default = "DuckDuckGo";
          PreventInstalls = true;
        };
        SearchSuggestEnabled = true;
        ShowHomeButton = true;
        StartDownloadsInTempDirectory = true;
      };
      enableGnomeExtensions = false;
    };
  };
}

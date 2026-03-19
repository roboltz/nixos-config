{ pkgs, lib, config, ... }:

{
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };
 
  config = lib.mkIf config.firefox.enable {

  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "Default";
      extensions.force = true;
      settings = {
	"browser.aboutConfig.showWarning" = false;
	"browser.startup.page" = 1;
	"browser.startup.homepage" = "about:home";
	"browser.newtabpage.enabled" = true;
	"browser.newtabpage.activity-stream.showSponsored" = false;
	"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
	"browser.newtabpage.activity-stream.default.sites" = "";
	"browser.newtabpage.activity-stream.feeds.system.topstories" = false;
	"browser.newtabpage.activity-stream.feeds.system.topsites" = false;
	"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

	"geo.provider.ms-windows-location" = false;
	"geo.provider.use_corelocation" = false;
	"geo.provider.use_geoclue" = false;

	"intl.accept_languages" = "en-US, en";
	"javascript.use_us_english_locale" = true;

	"extensions.getAddons.showPane" = false;
	"extensions.htmlaboutaddons.recommendations.enabled" = false;
	"browser.discovery.enabled" = false;
	
	"browser.newtabpage.activity-stream.feeds.telemetry" = false;
	"browser.newtabpage.activity-stream.telemetry" = false;
	"datareporting.policy.dataSubmissionEnabled" = false;
	"datareporting.healthreport.uploadEnabled" = false;
	"datareporting.usage.uploadEnabled" = false;
	"toolkit.telemetry.enabled" = false;
	"toolkit.telemetry.unified" = false;
	"toolkit.telemetry.server" = "data:,";
	"toolkit.telemetry.archive.enabled" = false;
	"toolkit.telemetry.newProfilePing.enabled" = false;
	"toolkit.telemetry.shutdownPingSender.enabled" = false;
	"toolkit.telemetry.updatePing.enabled" = false;
	"toolkit.telemetry.bhrPing.enabled" = false;
	"toolkit.telemetry.firstShutdownPing.enabled" = false;
	"toolkit.telemetry.coverage.opt-out" = true;
	"toolkit.coverage.opt-out" = true;
	"toolkit.coverage.endpoint.base" = "";

	"app.shield.optoutstudies.enabled" = false;
	"app.normandy.enabled" = false;
	"app.normandy.api_url" = "";

	"breakpad.reportURL" = "";
	"browser.tabs.crashReporting.sendReport" = false;

	"browser.safebrowsing.malware.enabled" = false;
	"browser.safebrowsing.phishing.enabled" = false;
	"browser.safebrowsing.blockedURIs.enabled" = false;
	"browser.safebrowsing.provider.google4.gethashURL" = "";
	"browser.safebrowsing.provider.google4.updateURL" = "";
	"browser.safebrowsing.provider.google.gethashURL" = "";
	"browser.safebrowsing.provider.google.updateURL" = "";
	"browser.safebrowsing.provider.google4.dataSharingURL" = "";
	"browser.safebrowsing.downloads.enabled" = false;
	"browser.safebrowsing.downloads.remote.enabled" = false;
	"browser.safebrowsing.downloads.remote.url" = "";
	"browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
	"browser.safebrowsing.downloads.remote.block_uncommon" = false;
	"browser.safebrowsing.allowOverride" = false;

	"network.prefetch-next" = false;
	"network.dns.disablePrefetch" = true;
	"network.dns.disablePrefetchFromHTTPS" = true;
	"network.predictor.enabled" = false;
	"network.http.speculative-parallel-limit" = 0;
	"network.places.speculativeConnect.enabled" = false;
	"network.gio.supported-protocols" = "";
	"network.file.disable_unc_paths" = true;
	"permissions.manager.defaultsUrl" = "";
	"network.IDN_show_punycode" = true;
	# "captivedetect.canonicalURL" = "";
	# "network.captive-portal-service.enabled" = false;
	# "network.connectivity-service.enabled" = false;
	
	"browser.urlbar.speculativeConnect.enabled" = false;
	"browser.urlbar.quicksuggest.enabled" = false;
	"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
	"browser.urlbar.suggest.quicksuggest.sponsored" = false;
	"browser.search.suggest.enabled" = false;
	"browser.urlbar.suggest.searches" = false;
	"browser.urlbar.trending.featureGate" = false;
	"browser.urlbar.addons.featureGate" = false;
	"browser.urlbar.mdn.featureGate" = false;
	"browser.urlbar.yelp.featureGate" = false;
	"browser.formfill.enable" = false;
	"extensions.formautofill.addresses.enabled" = false;
	"extensions.formautofill.creditCards.enabled" = false;

	"signon.rememberSignons" = false;
	"signon.autofillForms" = false;
	"signon.formlessCapture.enabled" = false;
	"network.auth.subresource-http-auth-allow" = 1;

	"browser.cache.disk.enable" = false;
	"browser.privatebrowsing.forceMediaMemoryCache" = false;
	"media.memory_cache_max_size" = 65536;
	"browser.sessionstore.privacy_level" = 1;
	"browser.sessionstore.resume_from_crash" = false;
	"toolkit.winRegisterApplicationRestart" = false;
	"browser.shell.shortcutFavicons" = false;
	"browser.pagethumbnails.capturing_disabled" = true;
	"browser.download.start_downloads_in_tmp_dir" = true;
	"browser.helperApps.deleteTempFileOnExit" = true;

	"security.tls.enable_0rtt_data" = false;
	"security.OCSP.require" = true;
	"browser.xul.error_pages.expert_bad_cert" = true;
	"security.cert_pinning.enforcement_level" = 2;
	"security.remote_settings.crlite_filters.enabled" = true;
	"security.pki.crlite_mode" = 2;
	"dom.security.https_only_mode" = true;
	"dom.security.https_only_mode_send_http_background_request" = false;

	"network.http.referer.XOriginTrimmingPolicy" = 2;
	
	"media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
	"media.peerconnection.ice.default_address_only" = true;
	"media.peerconnection.ice.no_host" = true;
	"webgl.disabled" = false;

	"browser.download.useDownloadDir" = false;
	"browser.download.manager.addToRecentDocs" = false;
	"browser.download.always_ask_before_handling_new_types" = true;

	"browser.contentblocking.category" = "strict";

	"dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
	"pdfjs.enableScripting" = false;
	"privacy.userContext.enabled" = true;
	"privacy.userContext.ui.enabled" = true;

	"extensions.enabledScopes" = 5;
	"extensions.postDownloadThirdPartyPrompt" = false;

	"privacy.sanitize.sanitizeOnShutdown" = true;
	"privacy.clearOnShutdown.cookies" = false;
	"privacy.clearOnShutdown.offlineApps" = true;
	"privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
	"privacy.clearOnShutdown_v2.downloads" = true;
	"privacy.clearOnShutdown_v2.formdata" = true;
	"privacy.sanitize.timeSpan" = 0;

	"privacy.resistFingerprinting" = false;
	"privacy.window.maxInnerWidth" = 1600;
	"privacy.window.maxInnerHeight" = 900;
	"privacy.resistFingerprinting.letterboxing" = false;
	"privacy.resistFingerprinting.block_mozAddonManager" = true;
	"privacy.spoof_english" = 1;
	"browser.display.use_system_colors" = true;
	"widget.non-native-theme.use-theme-accent" = true;
	"browser.link.open_newwindow.restriction" = 0;

	"browser.ml.chat.enabled" = false;
	"browser.ml.enable" = false;
	"browser.ml.linkPreview.enabled" = false;
	"browser.ml.pageAssist.enabled" = false;
	"browser.ml.smartAssist.enabled" = false;
	"browser.ml.chat.menu" = false;
	"extensions.ml.enabled" = false;
	"browser.tabs.groups.smart.enabled" = false;
	"browser.search.visualSearch.featureGate" = false;
	"browser.urlbar.quicksuggest.mlEnabled" = false;
	"pdfjs.enableAltText" = false;
	"places.semanticHistory.featureGate" = false;
	"sidebar.revamp" = false;

	"identity.fxaccounts.enabled" = false;

      };
      
    };

    policies = {
      SearchEngines = {
	Default = "DuckDuckGo";
      };

      ExtensionSettings = with builtins;
      let extension = shortId: uuid: {
        name = uuid;
        value = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
      in listToAttrs [
        (extension "ublock-origin" "uBlock0@raymondhill.net")
	(extension "1password-x-password-manager" "{d634138d-c276-4fc8-924b-40a0ea21d284}")
      ];
    };
  };
  
  stylix.targets.firefox = {
    profileNames = [ "default" ];
    colorTheme.enable = true;
  };
  };
}

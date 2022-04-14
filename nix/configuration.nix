{ config, pkgs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    firewall.enable = false;
    hostName = "rev9";
  };

  services = {
    xserver = {
      displayManager.lightdm = {
        greeters.enso-os.enable = true;
        enable = true;
      };

      windowManager.openbox.enable = true;
      videoDrivers = [ "modesetting" ];
      useGlamor = true;
      enable = true;
    };

    pipewire = {
      alsa = {
        support32Bit = true;
        enable = true;
      };

      pulse.enable = true;
      enable = true;
    };
  };

  hardware = {
    opengl = {
      driSupport = true;
      enable = true;
    };

    cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    pulseaudio.enable = true;
  };

  users.users.keter = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
  };

  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      noto-fonts-emoji-blob-bin
    ];
  
    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Code" ];
        sansSerif = [ "Fira Code" ];
        serif = [ "Fira Code" ];
        emoji = [ "Blobmoji" ];
      };
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Karachi";
  system.stateVersion = "22.05";
  security.rtkit.enable = true;
  sound.enable = true;
}


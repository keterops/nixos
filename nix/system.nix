{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Karachi";
  system.stateVersion = "22.05";
  security.rtkit.enable = true;
  sound.enable = true;
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd.availableKernelModules =
      [ "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
    kernelModules = [ "kvm-intel" ];
    cleanTmpDir = true;
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };

    interfaces.enp0s25.useDHCP = true;
    hostName = "rev9";
    useDHCP = false;
  };

  services = {
    xserver = {
      displayManager.lightdm = {
        greeters.pantheon.enable = true;
        enable = true;
      };

      desktopManager.pantheon.enable = true;
      videoDrivers = [ "modesetting" ];
      useGlamor = true;
      enable = true;
    };

    pipewire = {
      alsa = {
        enable = true;
        support32Bit = true;
      };

      enable = true;
      pulse.enable = true;
    };

    pantheon.apps.enable = false;
  };

  hardware = {
    opengl = {
      driSupport = true;
      enable = true;
    };

    cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    pulseaudio.enable = false;
  };

  users.users.keter = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
  };
}

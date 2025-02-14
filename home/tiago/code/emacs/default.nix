{ ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs:
      with epkgs; [
        # Core
        use-package
        which-key
        counsel
        ivy
        swiper

        # Development
        magit # Git integration
        projectile
        company # Completion framework
        flycheck # Syntax checking

        # Themes
        doom-themes
        catppuccin-theme
        all-the-icons

        # Language support
        markdown-mode
        nix-mode
        yaml-mode
        json-mode
      ];
    extraConfig = ''
                  ;; Basic UI configuration
                  (menu-bar-mode -1)
                  (tool-bar-mode -1)
                  (scroll-bar-mode -1)
                  (global-display-line-numbers-mode 1)

      				    ;; Font configuration
      						(set-face-attribute 'default nil
      																:family "JetBrains Mono"
      																:weight 'extra-bold
      																:height 150)

                  ;; Use-package configuration
                  (require 'use-package)
                  (setq use-package-always-ensure t)

                  ;; Theme setup
                  ;;(use-package doom-themes
                  ;;  :config
                  ;;  (load-theme 'doom-one t))

            			;; Theme setup
                  (use-package catppuccin-theme
                    :config
                    (load-theme 'catppuccin t))

                  ;; Which-key setup
                  (use-package which-key
                    :config
                    (which-key-mode))

                  ;; Ivy/Counsel/Swiper setup
                  (use-package ivy
                    :config
                    (ivy-mode 1)
                    (setq ivy-use-virtual-buffers t)
                    (setq enable-recursive-minibuffers t))

                  (use-package counsel
                    :config
                    (counsel-mode 1))

                  ;; Company mode setup
                  (use-package company
                    :hook
                    (after-init . global-company-mode))

                  ;; Projectile setup
                  (use-package projectile
                    :config
                    (projectile-mode +1)
                    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

                  ;; Magit setup
                  (use-package magit
                    :bind ("C-x g" . magit-status))

                  ;; Custom keybindings
                  (global-set-key (kbd "C-s") 'swiper)
                  (global-set-key (kbd "M-x") 'counsel-M-x)
                  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    '';
  };
}

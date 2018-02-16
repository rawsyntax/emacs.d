;; force loading of ruby-mode to fix hooks (avoid eval-after-load problem)
(require 'enh-ruby-mode)

(remove-hook 'ruby-mode-hook 'esk-run-coding-hook)
(remove-hook 'ruby-mode-hook 'inf-ruby-keys)

(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . enh-ruby-mode))

;; https://github.com/amatsuda/jb template
(add-to-list 'auto-mode-alist '("\\.jb$" . enh-ruby-mode))

(add-to-list 'auto-mode-alist '("/Berksfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Cheffile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Guardfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Procfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Puppetfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Thorfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("/Vagrantfile$" . enh-ruby-mode))

(add-to-list 'completion-ignored-extensions ".rbc")
(add-to-list 'completion-ignored-extensions ".rbo")

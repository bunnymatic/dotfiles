(setq-default rspec-use-spring-when-possible t)
(add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)

(require 'rspec-mode)


(setq opRunDistFamily
      (shell-command-to-string ". /etc/osmtInfo; echo -n ${opRunDistFamily}"))

(setq opRunDistGeneration
      (shell-command-to-string ". /etc/osmtInfo; echo -n ${opRunDistGeneration}"))

(setq bxDistGeneration
      (shell-command-to-string ". /etc/osmtInfo; echo -n ${bxDistGeneration}"))

(provide 'eoeLsip)


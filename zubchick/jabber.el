(setq jabber-auto-reconnect t
      jabber-avatar-verbose nil
      jabber-vcard-avatars-retrieve nil
      jabber-chat-buffer-format "*-jabber-%n-*"
      jabber-history-enabled t
      jabber-mode-line-mode t
      jabber-roster-buffer "*-jabber-*"
      jabber-show-offline-contacts nil
      jabber-roster-show-bindings nil
      jabber-alert-presence-message-function (lambda (who oldstatus
                                                     newstatus statustext) nil))

(add-hook 'jabber-chat-mode-hook 'goto-address)

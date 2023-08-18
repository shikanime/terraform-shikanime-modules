variable "gpg_keys" {
  type = map(object({
    public_key_armored = string
  }))
  description = "GitHub configuration"
  default = {
    altashar = {
      public_key_armored = <<-EOF
      -----BEGIN PGP PUBLIC KEY BLOCK-----

      mDMEZIGqyhYJKwYBBAHaRw8BAQdARNEqfN4qo/YY4pX7NbkluOJRfxG0JVIWM5fF
      JdGfIr+0RldpbGxpYW0gUGhldHNpbm9yYXRoIDx3aWxsaWFtLnBoZXRzaW5vcmF0
      aEBleHRlcm5hbC50b3RhbGVuZXJnaWVzLmNvbT6ImQQTFgoAQRYhBP355Y5rd1Nt
      IMLgfxtjjOsqktRYBQJkgarKAhsDBQkB4TOABQsJCAcCAiICBhUKCQgLAgQWAgMB
      Ah4HAheAAAoJEBtjjOsqktRY7pwA/jwR6Md2gWr/XlHW0GK0iMArB5J2RasfP3ev
      hbz/jur0AQD7z5qR0C8TqdkgyaA8q1my6xa5MiIg5b9NvJa0Ht/8C7g4BGSBqsoS
      CisGAQQBl1UBBQEBB0CM+3HSwbVEVVGeKUT3Saajx+md5/DWl3WuH+cJrcZ3MAMB
      CAeIfgQYFgoAJhYhBP355Y5rd1NtIMLgfxtjjOsqktRYBQJkgarKAhsMBQkB4TOA
      AAoJEBtjjOsqktRYDUYA/j7M/Fii9FOOBGRXXVIGs/6mOjvoBKeCBwVPaATeReqo
      AQDQxHhLwqhRbmv50p5B5AdPj8rcZ88wuREXQOf80hpcBQ==
      =Ts2r
      -----END PGP PUBLIC KEY BLOCK-----
      EOF
    }
  }
}

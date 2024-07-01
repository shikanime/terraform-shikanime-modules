variable "gpg_keys" {
  type = map(object({
    public_key_armored = string
  }))
  description = "GPG keys to add to the GitHub user"
  default = {
    default = {
      public_key_armored = <<-EOF
      -----BEGIN PGP PUBLIC KEY BLOCK-----

      mDMEZHoWABYJKwYBBAHaRw8BAQdA+sqU9FGTbIw1y+XlgJii8HT1ao4sC56FJATP
      9rvDRT20XFdpbGxpYW0gUGhldHNpbm9yYXRoIChMZXQncyBtYWtlIGxpZmUgZnVu
      IHlldCBhZ2FpbikgPHdpbGxpYW0ucGhldHNpbm9yYXRoQHNoaWthbmltZS5zdHVk
      aW8+iJkEExYKAEEWIQRp3iPbXOnacpRb3UOy5sRXgroY1wUCZHoWAAIbAwUJAeEz
      gAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRCy5sRXgroY13sFAQCF0Bi9
      8ufgug+ePtMZsX1Bd+/a0nBUba1M7Mxm8rNtuQD/WKtivC5frltUJujSqYJ0BcCF
      ru/d/H/fjzwCvG3/mQC4OARkehYAEgorBgEEAZdVAQUBAQdArgjzjRrYT87NNUot
      1Vw/j+j1bdprrJ4kFEqngs9rCFkDAQgHiH4EGBYKACYWIQRp3iPbXOnacpRb3UOy
      5sRXgroY1wUCZHoWAAIbDAUJAeEzgAAKCRCy5sRXgroY1/ESAQDPOl7tkcq58ONy
      iE/gOqq6z7f+HCLnHioHgCtXQtTmsAEA9cB0Seoe9gSzIwaiGk/dLiCvT1BsLwOH
      63ZqrUE5zgk=
      =NVVx
      -----END PGP PUBLIC KEY BLOCK-----
      EOF
    }
    sfeir = {
      public_key_armored = <<-EOF
      -----BEGIN PGP PUBLIC KEY BLOCK-----

      mDMEZHoW+hYJKwYBBAHaRw8BAQdApHjcS3pKHjp/kgW1TlvsGScVLM5zLCsUJM3e
      eeuBY+W0L1dpbGxpYW0gUGhldHNpbm9yYXRoIDxwaGV0c2lub3JhdGgud0BzZmVp
      ci5jb20+iJkEExYKAEEWIQQAdghOBIsREBZAmzIuxrxYR+k0YAUCZHoW+gIbAwUJ
      AeEzgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAuxrxYR+k0YGTWAP9C
      +50i4bS6L2GyOEM2KQ+ODmlu2pO0s/G0nhHwAfdQfgD/WYpMGXeXaTnUxBe+35Fz
      nEGXsmiE5PjV4/Bwq3jpmgC4OARkehb6EgorBgEEAZdVAQUBAQdAR4RS+tli1m0e
      9Vvzhxe1w4fciQeTF8NRpUvSAo0t7n8DAQgHiH4EGBYKACYWIQQAdghOBIsREBZA
      mzIuxrxYR+k0YAUCZHoW+gIbDAUJAeEzgAAKCRAuxrxYR+k0YG6MAP4yBFWTMUkR
      GVYujqdu1JQR3b4fyAbKtCuvKINoRi2ZwwEAouff0utpEdxJvvBYvzftAzTgvIXi
      ivgYK8maP9CrMgA=
      =YZc2
      -----END PGP PUBLIC KEY BLOCK-----
      EOF
    }
    tagheuer = {
      public_key_armored = <<-EOF
      -----BEGIN PGP PUBLIC KEY BLOCK-----
      
      mDMEZNI+0hYJKwYBBAHaRw8BAQdATGNRbNWO1ywxdQXh0RXPBrqjzXvdfQRIjXvH
      H5d0ZB20PFdpbGxpYW0gUGhldHNpbm9yYXRoIDx3aWxsaWFtLnBoZXRzaW5vcmF0
      aC1leHRAdGFnaGV1ZXIuY29tPoiUBBMWCgA8FiEELOolg8OoTxm6tB1LFOPWnGzf
      hZMFAmTSPtICGwMFCQHhM4AECwkIBwQVCgkIBRYCAwEAAh4FAheAAAoJEBTj1pxs
      34WTR6kBAIPycVtRrvPhb3fA78FUkK2F8D9eucDNZhOzlSYRVQFVAQDAc7fbsaGx
      8fVNJ9YT/yizWDItwAyh7sp+R+995UD/Abg4BGTSPtISCisGAQQBl1UBBQEBB0BB
      9mt5sJVDipMkjvv+01owzE65HMT3yfOTHrCdXmrmdgMBCAeIfgQYFgoAJhYhBCzq
      JYPDqE8ZurQdSxTj1pxs34WTBQJk0j7SAhsMBQkB4TOAAAoJEBTj1pxs34WTTnUA
      /i04h4nTl1kgfRVJy4ciwDGIHbqEDWDunOvgY203ZNZhAQDrCcqRD0youfhcQHmo
      1tfkhU/VUrjhUa7uhF9wQ5wvCQ==
      =spr0
      -----END PGP PUBLIC KEY BLOCK-----
      EOF
    }
  }
}

variable "cachix_token" {
  type        = string
  sensitive   = true
  description = "Cachix Token"
}

variable "wakatime_api_key" {
  type        = string
  sensitive   = true
  description = "Wakatime API Key"
}

variable "wakabox_github_gist_id" {
  type        = string
  description = "Wakabox GitHub Gist ID"
  default     = "18a5a8350c7bfe760adb6c37b6bbe5a9"
}

variable "wakabox_github_token" {
  type        = string
  sensitive   = true
  description = "Wakabox GitHub Token"
}

class PsqlTransporter < Formula
  desc "CLI to export/import Postgres databases safely"
  homepage "https://github.com/jpmeyer/psql-transporter"
  version "v1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jpmeyer/psql-transporter/releases/download/v1.0.0/psql-transporter_v1.0.0_darwin_arm64.tar.gz"
      sha256 "86b3e6670f3e971f369640904949c36611c06dc8962da041b0067ef9ea54323b"
    else
      url "https://github.com/jpmeyer/psql-transporter/releases/download/v1.0.0/psql-transporter_v1.0.0_darwin_amd64.tar.gz"
      sha256 "eb0831c3fb909c8c856a1636870671b6b106c1b28614bf20107dba4588f7e13d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jpmeyer/psql-transporter/releases/download/v1.0.0/psql-transporter_v1.0.0_linux_arm64.tar.gz"
      sha256 "e2bf84a9aadad1d732e3399d488729118221b2f2334b1f6b9383ea2bb64c1fe4"
    else
      url "https://github.com/jpmeyer/psql-transporter/releases/download/v1.0.0/psql-transporter_v1.0.0_linux_amd64.tar.gz"
      sha256 "2aef656c094f77823384182c9ba1a4c1cd4db86f1089b7f9dafc86621b27a7a7"
    end
  end

  def install
    bin.install "psql-transporter"
  end

  test do
    system "#{bin}/psql-transporter", "--version"
  end
end
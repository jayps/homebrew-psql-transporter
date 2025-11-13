class PsqlTransporter < Formula
  desc "CLI to export/import Postgres databases safely"
  homepage "https://github.com/jayps/psql-transporter"
  license "MIT"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.0/psql-transporter_v1.1.0_darwin_arm64.tar.gz"
      sha256 "f0364cff807f4dabbe72815a21629ca1447ed035f10de3b3195e960a38189fdb"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.0/psql-transporter_v1.1.0_darwin_amd64.tar.gz"
      sha256 "62428d5e1cef055cbd96fd51668e6fa7163f4b28758e7be7b2f3de21a23137cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.0/psql-transporter_v1.1.0_linux_arm64.tar.gz"
      sha256 "51aee153515320947e78bc6e50538bfe574a36d8d9b4d96ee75c5ece89fb3003"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.1.0/psql-transporter_v1.1.0_linux_amd64.tar.gz"
      sha256 "7d5c9ed30c66dab4113592e1b1f768bc4088355b6b493acf6a0867b019854aac"
    end
  end

  def install
    bin_path = Dir["**/psql-transporter"].first
    odie "psql-transporter binary not found in archive" if bin_path.nil?
    bin.install bin_path => "psql-transporter"
  end

  test do
    system "#{bin}/psql-transporter", "--version"
  end
end
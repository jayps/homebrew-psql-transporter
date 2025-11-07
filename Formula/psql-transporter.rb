class PsqlTransporter < Formula
  desc "CLI to export/import Postgres databases safely"
  homepage "https://github.com/jayps/psql-transporter"
  license "MIT"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.5/psql-transporter_v1.0.5_darwin_arm64.tar.gz"
      sha256 "dca5fee574af1f9d30969802c2709286e42648c921502f474c01115c162769ca"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.5/psql-transporter_v1.0.5_darwin_amd64.tar.gz"
      sha256 "13d736b53054e3d768ad0de729046abcbd8e84c1d79702dccdf08352ff865305"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.5/psql-transporter_v1.0.5_linux_arm64.tar.gz"
      sha256 "ff88d658e50e7a30e5b9f5f79ab41b91d0b2fb71761b418301f11f7dbd1aac32"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.5/psql-transporter_v1.0.5_linux_amd64.tar.gz"
      sha256 "a5f40f39fa360eb41946f5aaf4c957334d6e9062c8d0a2a2dda136a1a96e0180"
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
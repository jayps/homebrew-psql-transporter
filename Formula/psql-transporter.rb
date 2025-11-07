class PsqlTransporter < Formula
  desc "CLI to export/import Postgres databases safely"
  homepage "https://github.com/jayps/psql-transporter"
  license "MIT"
  version "1.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.9/psql-transporter_v1.0.9_darwin_arm64.tar.gz"
      sha256 "eae576faa82313599b803cee92244fbd2c37c05a3bd67f96e136a055228206b5"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.9/psql-transporter_v1.0.9_darwin_amd64.tar.gz"
      sha256 "0ea24ddd430c1c79810eafa948ce272b0d3c8b1d110f764f810b010f5bfe6ccb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.9/psql-transporter_v1.0.9_linux_arm64.tar.gz"
      sha256 "ff713012048cdacae74ead30ecc3d695d4a5ea4ec6583a18f1e7267553cc2756"
    else
      url "https://github.com/jayps/psql-transporter/releases/download/v1.0.9/psql-transporter_v1.0.9_linux_amd64.tar.gz"
      sha256 "af8dde1c7c819cb646b9196be27816d672beaa6d2e454fa4578e5040ff34af9c"
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
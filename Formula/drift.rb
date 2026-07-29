class Drift < Formula
  desc "Ticket-based git TUI"
  homepage "https://github.com/Sknoww/drift"
  url "https://github.com/Sknoww/drift/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8e3845f4f1c1f8704c0c1d623a13df89fb6b037dd0dfc02a40190e23b3e39992"
  license "MIT"
  head "https://github.com/Sknoww/drift.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drift -version")
  end
end

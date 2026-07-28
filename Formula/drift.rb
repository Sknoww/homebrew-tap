class Drift < Formula
  desc "Ticket-based git TUI"
  homepage "https://github.com/Sknoww/drift"
  url "https://github.com/Sknoww/drift/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "724ca13bcfd51138e2bb2fad50dea275ff79a4c9834dba739504ae73390be931"
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

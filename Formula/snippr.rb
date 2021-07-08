# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Snippr < Formula
  desc ""
  homepage ""
  version "0.5.7"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/snippr-io/homebrew-cli/releases/download/0.5.7/snippr-darwin-amd64.tar.gz"
      sha256 "df187d616b0b0033402ba177457d4fb197a6bc027d8d894a3e65c9378b1a35f7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/snippr-io/homebrew-cli/releases/download/0.5.7/snippr-linux-amd64.tar.gz"
      sha256 "26fa3fcdfc2e394d15ccc4765bc2a3564a0bbbeedae96e4a7f02327f6f78ab50"
    end
  end

  def install
    bin.install "snippr"
  end
end

# frozen_string_literal: true

require "minitest/autorun"
require "minitest/spec"
require_relative "ds"
require_relative "computer"

# Computer specs
class ComputerSpec < Minitest::Spec
  describe Computer do
    before do
      ds = DS.new
      @workstation = Computer.new(1, ds)
    end

    describe "#mouse" do
      it "should respond to mouse method" do
        @workstation.must_respond_to "mouse"
      end

      it "should return mouse description" do
        mouse = @workstation.mouse
        mouse.must_match "Mouse: Wireless Touch ($60)"
      end
    end

    describe "#cpu" do
      it "should respond to cpu method" do
        @workstation.must_respond_to "cpu"
      end

      it "should return cpu description" do
        cpu = @workstation.cpu
        cpu.must_match "* Cpu: 2.9 Ghz quad-core ($120)"
      end

      it "should include *" do
        cpu = @workstation.cpu
        cpu.must_include "*"
      end
    end

    describe "#keyboard" do
      it "should respond to keyboard method" do
        @workstation.must_respond_to "keyboard"
      end

      it "should return keyboard description" do
        keyboard = @workstation.keyboard
        keyboard.must_match "Keyboard: Standard US ($20)"
      end
    end

    describe "#unknown_method" do
      it "should raise an exception" do
        proc { @workstation.unknown_method }.must_raise NoMethodError
      end
    end
  end
end

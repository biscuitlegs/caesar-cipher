require_relative '../lib/caesar_cipher'

describe '#caesar_cipher' do
    context "when given incorrect argument types" do
        it "returns #error_message" do
            expect(caesar_cipher(7, "hello")).to eql(error_message)
        end
    end
    context "when given correct argument types" do
        context "when string includes a non-letter" do
            it "does not shift a non-letter" do
                expect(caesar_cipher("a!?#a", 3)).to eql("d!?#d")
            end
        end
        context "when string includes uppercase letters" do
            it "retains capitalization of letters" do
                expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
            end
        end
        context "when no wrapping is needed" do
            it "returns a correctly shifted string" do
                expect(caesar_cipher("aaaaa", 1)).to eql("bbbbb")
            end
        end
        context "when wrapping backwards" do
            it "returns a correctly shifted string" do
                expect(caesar_cipher("aaaaz", 1)).to eql("bbbba")
            end
        end
        context "when wrapping forwards" do
            it "returns a correctly shifted string" do
                expect(caesar_cipher("aaaaa", -1)).to eql("zzzzz")
            end
        end
    end
end
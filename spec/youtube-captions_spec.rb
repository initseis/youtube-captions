require_relative "../lib/youtube-captions"

describe YoutubeCaptions::Video do
  subject { YoutubeCaptions::Video.new(id: id) }
  let(:id) { "UYm0kfnRTJk" }

  context "when video has no captions" do
    let(:id) { "abc123" }
    it "should raise NoCaptionsAvailableError error" do
      expect { subject }.to raise_error(YoutubeCaptions::NoCaptionsAvailableError)
    end
  end

  describe "#captions" do
    subject { YoutubeCaptions::Video.new(id: id).captions }

    it "returns captions" do
      expect(subject.first).to have_key("__content__")
      expect(subject.first).to have_key("start")
      expect(subject.first).to have_key("dur")
    end

    context "when lang param is passed" do
      subject { YoutubeCaptions::Video.new(id: id).captions(lang: lang) }
      let(:lang) { "en" }

      it "returns captions" do
        expect(subject.first).to have_key("__content__")
        expect(subject.first).to have_key("start")
        expect(subject.first).to have_key("dur")
      end

      context "when lang is not available" do
        let(:lang) { "ja" }

        it "should raise LangNotAvailableError error" do
          expect { subject }.to raise_error(YoutubeCaptions::LangNotAvailableError)
        end
      end
    end
  end

  describe "#available_langs" do
    subject { YoutubeCaptions::Video.new(id: id).available_langs }

    it "returns available langs" do
      expect(subject.is_a?(Array)).to be_truthy
      expect(subject.empty?).to be_falsey
    end
  end
end

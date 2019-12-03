RSpec.describe Evaluation do
  let(:instance) { described_class.new }

  describe '.methods' do
    it { is_expected.to respond_to(:build) }
    it { expect(subject.respond_to?(:evaluate, true)).to eq true }
  end

  describe '#build' do
    subject { instance.build(input) }

    context 'when given 1' do
      let(:input) { 1 }
      it { is_expected.to eq('1') }
    end

    context 'when given 5' do
      let(:input) { 5 }
      it { is_expected.to eq('1, 2, 3, 4, Nama') }
    end

    context 'when given 7' do
      let(:input) { 7 }
      it { is_expected.to eq('1, 2, 3, 4, Nama, 6, Team') }
    end

    context 'when given 35' do
      let(:input) { 35 }

      let(:response) do
        '1, 2, 3, 4, Nama, 6, Team, 8, 9, Nama, 11, 12, 13, Team, Nama, ' \
        '16, 17, 18, 19, Nama, Team, 22, 23, 24, Nama, 26, 27, Team, 29, ' \
        'Nama, 31, 32, 33, 34, Nama Team'
      end

      it { is_expected.to eq(response) }
    end

    context 'when given 100' do
      let(:input) { 100 }

      let(:response) do
        '1, 2, 3, 4, Nama, 6, Team, 8, 9, Nama, 11, 12, 13, Team, Nama, 16, 17, 18, 19, Nama, Team, 22, 23, 24, Nama, 26, 27, Team, 29, Nama, 31, 32, 33, 34, Nama Team, ' \
        '36, 37, 38, 39, Nama, 41, Team, 43, 44, Nama, 46, 47, 48, Team, Nama, 51, 52, 53, 54, Nama, Team, 57, 58, 59, Nama, 61, 62, Team, 64, Nama, 66, 67, 68, 69, Nama Team, ' \
        '71, 72, 73, 74, Nama, 76, Team, 78, 79, Nama, 81, 82, 83, Team, Nama, 86, 87, 88, 89, Nama, Team, 92, 93, 94, Nama, 96, 97, Team, 99, Nama'
      end

      it { is_expected.to eq(response) }
    end

    context 'when input is not a integer' do
      let(:input) { double }

      before { allow(input).to receive(:is_a?).with(Integer).and_return(false) }

      it { expect { subject }.to raise_error(ArgumentError) }
    end

    context 'when input is not positive' do
      let(:input) { double }

      before do
        allow(input).to receive(:is_a?).with(Integer).and_return(true)
        allow(input).to receive(:positive?).and_return(false)
      end

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe '#evaluate' do
    subject { described_class.new.send(:evaluate, number) }

    context 'when given a multiple of 35' do
      let(:number) { (1..100).select { |i| i.modulo(35).zero? }.sample }

      it { is_expected.to eq 'Nama Team' }
    end

    context 'when given a multiple of 7 (except multiples of 35)' do
      let(:number) do
        (1..100).select { |i| i.modulo(7).zero? && !i.modulo(5).zero? }.sample
      end

      it { is_expected.to eq 'Team' }
    end

    context 'when given a multiple of 5 (except multiples of 35)' do
      let(:number) do
        (1..100).select { |i| i.modulo(5).zero? && !i.modulo(7).zero? }.sample
      end

      it { is_expected.to eq 'Nama' }
    end

    context 'when not a multiple of 5, 7 neither 35' do
      let(:number) do
        (1..100).select { |i| !i.modulo(5).zero? && !i.modulo(7).zero? }.sample
      end

      it { is_expected.to eq number.to_s }
    end
  end
end

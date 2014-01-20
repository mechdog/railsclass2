require_relative '../todo.rb'

describe Task do
  subject { described_class.new(description: 'Feed the cat')}

  describe '#to_s' do
    it "returns the value of the task's description" do
      expect(subject.to_s).to eq('Feed the cat')
    end
  end
end

describe SimpleStore do
  describe 'instance methods' do
    let(:subject_class) { Class.new(described_class)}

    subject {subject_class.new}

    describe '#save' do
      it 'stores the item in the class' do
        subject.save
        expect(subject_class.all).to include(subject)
      end
    end

    describe '#destory' do
      before do
        subject_class.add(subject)
      end

      it "removes the item from the class's strage" do
        subject.destroy
        expect(subject_class.all).not_to include(subject)
      end
    end
end

describe 'class methods' do
  subject { Class.new(described_class)  }

  describe '::all' do
    it 'should be empty until something has been added' do
      expect(subject.all).to be_empty
    end
  end

  describe '::add' do
    let(:item) { double('item')}

    it 'should store and item on the class' do
      subject.add(item)
      expect(subject.all).to include(item)
    end
  end

  describe '::create' do
    it 'should create a new item, store it on the class and return it' do
      new_item = subject.create
      expect(subject.all).to include(new_item)
    end
  end
end
end









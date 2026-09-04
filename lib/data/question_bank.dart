import '../models/clue_question.dart';

// Curated question bank for QuizBangla Clue Challenge.
// Content rule: each clue must point to only one answer among the four options.
const List<ClueQuestion> clueQuestions = [

  // Bangladesh Places
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Moulvibazar',
    clues: [
      'I belong to Sylhet Division, unlike the other answer choices.',
      'Tea estates are one of the landscapes most strongly associated with me.',
      'Lawachara National Park is located in my district.',
    ],
    options: ['Moulvibazar', 'Bogura', 'Cumilla', 'Jashore'],
    explanation: 'Moulvibazar is a district of Sylhet Division known for tea estates; Lawachara National Park is in Kamalganj, Moulvibazar.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Cox\'s Bazar',
    clues: [
      'I am the southeastern coastal district among these choices.',
      'I am famous for a very long natural sandy sea beach.',
      'Teknaf is one of my upazilas.',
    ],
    options: ['Cox\'s Bazar', 'Rajshahi', 'Sylhet', 'Mymensingh'],
    explanation: 'Cox\'s Bazar is a coastal district in Chattogram Division, famous for its beach and the Teknaf area.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Rangamati',
    clues: [
      'Kaptai Lake is located in my district.',
      'I am one of the three districts of the Chattogram Hill Tracts.',
      'Kaptai Dam is also closely associated with me.',
    ],
    options: ['Rangamati', 'Bandarban', 'Khagrachhari', 'Feni'],
    explanation: 'Rangamati is a Chattogram Hill Tracts district best known for Kaptai Lake and Kaptai Dam.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Bagerhat',
    clues: [
      'The UNESCO-listed Historic Mosque City is located in my district.',
      'The Sixty Dome Mosque is my best-known historic landmark.',
      'I am a district of Khulna Division.',
    ],
    options: ['Bagerhat', 'Khulna', 'Satkhira', 'Barishal'],
    explanation: 'Bagerhat is home to the UNESCO World Heritage Historic Mosque City, including the Sixty Dome Mosque.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Paharpur',
    clues: [
      'Somapura Mahavihara is located at me.',
      'My Buddhist monastery ruins are a UNESCO World Heritage Site.',
      'I am in Naogaon District.',
    ],
    options: ['Paharpur', 'Mainamati', 'Mahasthangarh', 'Sonargaon'],
    explanation: 'Paharpur in Naogaon is the site of Somapura Mahavihara, a UNESCO World Heritage property.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Sonargaon',
    clues: [
      'Panam City is one of my famous historic attractions.',
      'I am located in Narayanganj District.',
      'I was an important historic administrative and commercial centre of Bengal.',
    ],
    options: ['Sonargaon', 'Paharpur', 'Mahasthangarh', 'Mainamati'],
    explanation: 'Sonargaon is a historic area in Narayanganj and is closely associated with Panam City.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Kuakata',
    clues: [
      'I am the sea-beach destination among these choices that lies in Patuakhali District.',
      'Visitors know me for views of both sunrise and sunset over the sea.',
      'I face the Bay of Bengal from the southern coast of Bangladesh.',
    ],
    options: ['Kuakata', 'Patenga', 'Cox\'s Bazar', 'Saint Martin\'s Island'],
    explanation: 'Kuakata is a coastal tourist destination in Patuakhali, known for its wide beach and sunrise and sunset views.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Mahasthangarh',
    clues: [
      'I am the ancient fortified settlement among these choices located in Bogura District.',
      'I am associated with ancient Pundranagara.',
      'My archaeological remains stand near the Karatoya River.',
    ],
    options: ['Mahasthangarh', 'Mainamati', 'Paharpur', 'Wari-Bateshwar'],
    explanation: 'Mahasthangarh in Bogura is one of the oldest major archaeological sites in Bangladesh and is identified with ancient Pundranagara.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Saint Martin\'s Island',
    clues: [
      'I lie in the Bay of Bengal off the Teknaf coast.',
      'I am an island destination at the far southeast of Bangladesh.',
      'Travellers traditionally reach me by sea from the Teknaf area.',
    ],
    options: ['Saint Martin\'s Island', 'Sandwip', 'Nijhum Dwip', 'Kutubdia'],
    explanation: 'Saint Martin\'s Island lies off the Teknaf coast in the southeastern part of Bangladesh.',
  ),
  ClueQuestion(
    category: 'Bangladesh Places',
    answer: 'Lalbagh Fort',
    clues: [
      'I am the Mughal-era fort complex among these choices in Old Dhaka.',
      'My construction began in the seventeenth century.',
      'The tomb of Pari Bibi is inside my complex.',
    ],
    options: ['Lalbagh Fort', 'Ahsan Manzil', 'Curzon Hall', 'Star Mosque'],
    explanation: 'Lalbagh Fort is a seventeenth-century Mughal fort complex in Old Dhaka and contains the tomb of Pari Bibi.',
  ),

  // Food & Culture
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Pitha',
    clues: [
      'I am a family of traditional cakes and snacks especially associated with winter.',
      'Rice flour is commonly used to make many of my varieties.',
      'Bhapa, patishapta and chitoi are examples of me.',
    ],
    options: ['Pitha', 'Haleem', 'Fuchka', 'Jhalmuri'],
    explanation: 'Pitha refers to many traditional Bengali cakes and snacks, with varieties such as bhapa, patishapta and chitoi.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Pohela Boishakh',
    clues: [
      'I mark the first day of the Bengali calendar.',
      'Fairs, music and colourful celebrations are commonly associated with me.',
      'I am the Bengali New Year celebration.',
    ],
    options: ['Pohela Boishakh', 'Nabanna', 'Pohela Falgun', 'Victory Day'],
    explanation: 'Pohela Boishakh is the first day of the Bengali year and is widely celebrated across Bangladesh.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Jamdani',
    clues: [
      'I am the handloom textile among these choices traditionally woven around Dhaka.',
      'My fabric is known for intricate motifs added during weaving.',
      'UNESCO inscribed my traditional weaving art in 2013.',
    ],
    options: ['Jamdani', 'Nakshi Kantha', 'Shital Pati', 'Gamcha'],
    explanation: 'Jamdani is a finely patterned handwoven textile associated with the Dhaka region; its weaving tradition is recognized by UNESCO.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Nakshi Kantha',
    clues: [
      'I am the embroidered quilt among these choices made from layers of cloth.',
      'Decorative running stitches and folk motifs are central to my design.',
      'My name combines a word for decorative design with a traditional quilt.',
    ],
    options: ['Nakshi Kantha', 'Jamdani', 'Shital Pati', 'Alpana'],
    explanation: 'Nakshi Kantha is a traditional embroidered quilt made from layered cloth and decorated with stitched motifs.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Shital Pati',
    clues: [
      'I am the traditional mat among these choices woven from murta cane.',
      'I am used as a cool sitting or sleeping mat.',
      'UNESCO recognizes the traditional art of weaving me in the Sylhet region.',
    ],
    options: ['Shital Pati', 'Jamdani', 'Nakshi Kantha', 'Gamcha'],
    explanation: 'Shital Pati is a handcrafted mat woven from murta cane, especially associated with the greater Sylhet region.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Mangal Shobhajatra',
    clues: [
      'I am the public procession among these choices organized for Pahela Baishakh by Dhaka University\'s Faculty of Fine Art.',
      'Large masks and colourful floats are characteristic of me.',
      'UNESCO inscribed me on its Representative List in 2016.',
    ],
    options: ['Mangal Shobhajatra', 'Ekushey Book Fair', 'Nabanna Utsab', 'Dhaka Art Summit'],
    explanation: 'Mangal Shobhajatra is the Pahela Baishakh procession associated with Dhaka University\'s Faculty of Fine Art and is recognized by UNESCO.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Baul songs',
    clues: [
      'I belong to the mystic minstrel tradition among these choices.',
      'Ektara and dotara are instruments often associated with my performers.',
      'UNESCO recognizes me as intangible cultural heritage of Bangladesh.',
    ],
    options: ['Baul songs', 'Bhatiali', 'Bhawaiya', 'Jari'],
    explanation: 'Baul songs come from the Baul mystic minstrel tradition of Bengal and are recognized by UNESCO.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Ekushey Book Fair',
    clues: [
      'I am the major February book fair among these choices.',
      'My identity is closely connected with the Language Movement and Ekushey February.',
      'Bangla Academy is central to my organization in Dhaka.',
    ],
    options: ['Ekushey Book Fair', 'Dhaka International Trade Fair', 'Boishakhi Mela', 'Dhaka Art Summit'],
    explanation: 'The Ekushey Book Fair is held in February and is closely connected with the memory of the Language Movement.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Rickshaw painting',
    clues: [
      'I am the colourful visual art among these choices traditionally painted on Dhaka rickshaws.',
      'Bright scenes, motifs and decorative panels are typical of me.',
      'UNESCO inscribed rickshaws and my art in 2023.',
    ],
    options: ['Rickshaw painting', 'Alpana', 'Jamdani', 'Nakshi Kantha'],
    explanation: 'Dhaka rickshaw painting is a distinctive urban folk-art tradition and was inscribed by UNESCO in 2023 with rickshaws.',
  ),
  ClueQuestion(
    category: 'Food & Culture',
    answer: 'Hilsa',
    clues: [
      'I am the national fish of Bangladesh among these choices.',
      'I am especially associated with Bengali cuisine and celebrations.',
      'My Bengali name is ilish.',
    ],
    options: ['Hilsa', 'Rohu', 'Koi', 'Pabda'],
    explanation: 'Hilsa, or ilish, is the national fish of Bangladesh and an important part of Bengali cuisine.',
  ),

  // Famous People
  ClueQuestion(
    category: 'Famous People',
    answer: 'Kazi Nazrul Islam',
    clues: [
      'I am the National Poet of Bangladesh among these choices.',
      'I am widely known as the Rebel Poet.',
      '"Bidrohi" is one of my most famous poems.',
    ],
    options: ['Kazi Nazrul Islam', 'Jibanananda Das', 'Jasimuddin', 'Sukanta Bhattacharya'],
    explanation: 'Kazi Nazrul Islam is the National Poet of Bangladesh and is known as the Rebel Poet; "Bidrohi" is one of his landmark works.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Begum Rokeya',
    clues: [
      'I am the pioneering advocate of women\'s education among these choices who wrote "Sultana\'s Dream".',
      'I founded a school for Muslim girls in Kolkata.',
      'Rokeya Day is observed in Bangladesh in my memory.',
    ],
    options: ['Begum Rokeya', 'Sufia Kamal', 'Pritilata Waddedar', 'Ila Mitra'],
    explanation: 'Begum Rokeya was a writer and social reformer who championed women\'s education and wrote "Sultana\'s Dream".',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Zainul Abedin',
    clues: [
      'I am the artist among these choices famous for drawings of the Bengal famine of 1943.',
      'I am commonly known by the title Shilpacharya.',
      'I played a pioneering role in modern art education in Dhaka.',
    ],
    options: ['Zainul Abedin', 'Quamrul Hassan', 'S. M. Sultan', 'Shahabuddin Ahmed'],
    explanation: 'Zainul Abedin, known as Shilpacharya, is renowned for his 1943 famine sketches and his role in modern art education.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Jasimuddin',
    clues: [
      'I am the poet among these choices popularly called Palli Kabi.',
      'Rural Bengal and folk life are central themes in my work.',
      '"Naksi Kanthar Math" is one of my best-known works.',
    ],
    options: ['Jasimuddin', 'Shamsur Rahman', 'Al Mahmud', 'Farrukh Ahmad'],
    explanation: 'Jasimuddin is known as Palli Kabi, the poet of rural Bengal, and wrote "Naksi Kanthar Math".',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Sufia Kamal',
    clues: [
      'I am the poet and activist among these choices whose first poetry collection was "Sanjher Maya".',
      'I was a major voice in cultural and women\'s movements in Bangladesh.',
      'A residential hall at the University of Dhaka bears my name.',
    ],
    options: ['Sufia Kamal', 'Begum Rokeya', 'Selina Hossain', 'Rabeya Khatun'],
    explanation: 'Sufia Kamal was a prominent Bangladeshi poet and activist; "Sanjher Maya" was her first poetry collection.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Lalon Shah',
    clues: [
      'I am the Baul philosopher among these choices whose shrine is at Cheuriya in Kushtia.',
      'My songs explore humanity, spirituality and social divisions.',
      'I am one of the most influential figures of the Baul tradition.',
    ],
    options: ['Lalon Shah', 'Hason Raja', 'Abbasuddin Ahmed', 'Radharaman Dutta'],
    explanation: 'Lalon Shah was a major Baul philosopher and songwriter; his shrine is at Cheuriya in Kushtia.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Michael Madhusudan Dutt',
    clues: [
      'I am the Bengali poet among these choices born at Sagardari in Jashore.',
      '"Meghnad Badh Kavya" is my most famous epic poem.',
      'I helped popularize blank verse in Bengali poetry.',
    ],
    options: ['Michael Madhusudan Dutt', 'Jibanananda Das', 'Bankim Chandra Chattopadhyay', 'Sukanta Bhattacharya'],
    explanation: 'Michael Madhusudan Dutt was born in Sagardari, Jashore, and is famous for "Meghnad Badh Kavya" and Bengali blank verse.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Humayun Ahmed',
    clues: [
      'I am the writer among these choices who created both Himu and Misir Ali.',
      'I was also a filmmaker and television dramatist.',
      'Nuhash Palli is closely associated with me.',
    ],
    options: ['Humayun Ahmed', 'Muhammed Zafar Iqbal', 'Syed Shamsul Haq', 'Anisul Hoque'],
    explanation: 'Humayun Ahmed was a celebrated novelist, dramatist and filmmaker who created the characters Himu and Misir Ali.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Quamrul Hassan',
    clues: [
      'I am the Bangladeshi artist among these choices commonly known as Patua Quamrul Hassan.',
      'Folk forms and bold graphic lines strongly influenced my art.',
      'I was one of the important figures in the development of modern art in Bangladesh.',
    ],
    options: ['Quamrul Hassan', 'Zainul Abedin', 'S. M. Sultan', 'Aminul Islam'],
    explanation: 'Quamrul Hassan, often called Patua, was a major modern Bangladeshi artist known for strong folk influences.',
  ),
  ClueQuestion(
    category: 'Famous People',
    answer: 'Fazle Hasan Abed',
    clues: [
      'I am the development leader among these choices who founded BRAC in 1972.',
      'My work focused on poverty reduction, education and social development.',
      'The organization I founded grew from Bangladesh into a major international development organization.',
    ],
    options: ['Fazle Hasan Abed', 'Muhammad Yunus', 'A. K. Khan', 'Abul Maal Abdul Muhith'],
    explanation: 'Fazle Hasan Abed founded BRAC in 1972 and became internationally known for large-scale social-development work.',
  ),

  // Sports
  ClueQuestion(
    category: 'Sports',
    answer: 'Shakib Al Hasan',
    clues: [
      'I am the Bangladesh cricketer among these choices known as a left-handed batter and slow left-arm orthodox bowler.',
      'I have represented Bangladesh as an international all-rounder.',
      'I have held the top position in ICC all-rounder rankings during my career.',
    ],
    options: ['Shakib Al Hasan', 'Tamim Iqbal', 'Mushfiqur Rahim', 'Taskin Ahmed'],
    explanation: 'Shakib Al Hasan is a left-handed batter and slow left-arm orthodox bowler, widely known as an international all-rounder.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Mashrafe Bin Mortaza',
    clues: [
      'I am the former Bangladesh captain among these choices whose primary role was fast bowling.',
      'I led Bangladesh in many limited-overs matches.',
      'I was known for repeatedly returning to cricket after serious knee injuries.',
    ],
    options: ['Mashrafe Bin Mortaza', 'Habibul Bashar', 'Khaled Mashud', 'Mohammad Rafique'],
    explanation: 'Mashrafe Bin Mortaza was a fast bowler and long-serving limited-overs captain for Bangladesh.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Tamim Iqbal',
    clues: [
      'I am the left-handed opening batter among these choices who represented Bangladesh for many years.',
      'Opening the innings was my main batting role.',
      'I am associated with Chattogram and come from a well-known sporting family.',
    ],
    options: ['Tamim Iqbal', 'Mahmudullah', 'Mushfiqur Rahim', 'Mustafizur Rahman'],
    explanation: 'Tamim Iqbal is a left-handed opening batter who had a long international career for Bangladesh.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Mushfiqur Rahim',
    clues: [
      'I am the Bangladesh wicketkeeper-batter among these choices who made the country\'s first Test double century.',
      'That double century came against Sri Lanka in 2013.',
      'I have played for Bangladesh both as a wicketkeeper and a specialist batter.',
    ],
    options: ['Mushfiqur Rahim', 'Tamim Iqbal', 'Mahmudullah', 'Liton Das'],
    explanation: 'Mushfiqur Rahim scored Bangladesh\'s first Test double century, making 200 against Sri Lanka in 2013.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Kabaddi',
    clues: [
      'I am the national sport of Bangladesh among these choices.',
      'A raider enters the opposing half and tries to tag defenders before returning.',
      'I am a contact team sport played without a ball.',
    ],
    options: ['Kabaddi', 'Cricket', 'Football', 'Hockey'],
    explanation: 'Kabaddi is the national sport of Bangladesh and is built around raiding and defending without a ball.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Sher-e-Bangla National Cricket Stadium',
    clues: [
      'I am the major cricket venue among these choices located in Mirpur, Dhaka.',
      'Bangladesh regularly hosts international cricket matches at me.',
      'I am named Sher-e-Bangla National Cricket Stadium.',
    ],
    options: ['Sher-e-Bangla National Cricket Stadium', 'MA Aziz Stadium', 'Sylhet International Cricket Stadium', 'Bangabandhu National Stadium'],
    explanation: 'Sher-e-Bangla National Cricket Stadium is the major international cricket ground in Mirpur, Dhaka.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Bangladesh Premier League',
    clues: [
      'I am the franchise-based Twenty20 cricket competition among these choices.',
      'Teams representing different cities or regions compete in me.',
      'I am commonly abbreviated as BPL.',
    ],
    options: ['Bangladesh Premier League', 'National Cricket League', 'Bangladesh Cricket League', 'Dhaka Premier Division Cricket League'],
    explanation: 'The Bangladesh Premier League is the country\'s franchise-based Twenty20 cricket competition.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: '1997 ICC Trophy',
    clues: [
      'I am the tournament Bangladesh won in Kuala Lumpur in 1997.',
      'That victory helped Bangladesh qualify for the 1999 Cricket World Cup.',
      'Bangladesh defeated Kenya in my final.',
    ],
    options: ['1997 ICC Trophy', '1999 Cricket World Cup', '2000 Asia Cup', '2004 ICC Champions Trophy'],
    explanation: 'Bangladesh won the 1997 ICC Trophy in Kuala Lumpur, defeating Kenya in the final and qualifying for the 1999 World Cup.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Aminul Islam',
    clues: [
      'I am the Bangladesh batter among these choices who scored 145 in the country\'s inaugural Test match.',
      'That match was against India in Dhaka in November 2000.',
      'I am also widely known by the nickname Bulbul.',
    ],
    options: ['Aminul Islam', 'Habibul Bashar', 'Akram Khan', 'Naimur Rahman'],
    explanation: 'Aminul Islam scored 145 against India in Bangladesh\'s inaugural Test in 2000.',
  ),
  ClueQuestion(
    category: 'Sports',
    answer: 'Niaz Murshed',
    clues: [
      'I am the chess player among these choices who holds the FIDE title of Grandmaster for Bangladesh.',
      'I became Bangladesh\'s first chess Grandmaster.',
      'My international career made me a landmark figure in South Asian chess.',
    ],
    options: ['Niaz Murshed', 'Rani Hamid', 'Ziaur Rahman', 'Abdullah Al Rakib'],
    explanation: 'Niaz Murshed is a Bangladeshi chess Grandmaster and is recognized as the country\'s first player to earn the GM title.',
  ),
];

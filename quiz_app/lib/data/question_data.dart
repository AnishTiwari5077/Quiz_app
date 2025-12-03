import 'package:quiz_app/models/question_model.dart';

final Map<String, List<Question>> quizData = {
  'General Knowledge': [
    Question(
      question: 'What is the capital of Nepal?',
      options: ['Berlin', 'Kathmandu', 'Paris', 'Madrid'],
      correctIndex: 1,
      explanation: 'Kathmandu is the capital and largest city of Nepal.',
    ),
    Question(
      question: 'Which planet is known as the Red Planet?',
      options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      correctIndex: 1,
      explanation: 'Mars appears red due to iron oxide on its surface.',
    ),
    Question(
      question: 'What is the largest ocean on Earth?',
      options: [
        'Atlantic Ocean',
        'Indian Ocean',
        'Arctic Ocean',
        'Pacific Ocean',
      ],
      correctIndex: 3,
      explanation:
          'The Pacific Ocean covers about 46% of Earth\'s water surface.',
    ),
    Question(
      question: 'Who painted the Mona Lisa?',
      options: [
        'Vincent van Gogh',
        'Pablo Picasso',
        'Leonardo da Vinci',
        'Michelangelo',
      ],
      correctIndex: 2,
      explanation:
          'Leonardo da Vinci painted the Mona Lisa in the early 16th century.',
    ),
    Question(
      question: 'What is the smallest country in the world?',
      options: ['Monaco', 'Vatican City', 'San Marino', 'Liechtenstein'],
      correctIndex: 1,
      explanation:
          'Vatican City is the smallest country with an area of 0.44 km².',
    ),
    Question(
      question: 'How many continents are there?',
      options: ['5', '6', '7', '8'],
      correctIndex: 2,
      explanation:
          'There are 7 continents: Africa, Antarctica, Asia, Europe, North America, Oceania, and South America.',
    ),
    Question(
      question: 'What is the largest mammal in the world?',
      options: ['African Elephant', 'Blue Whale', 'Giraffe', 'Polar Bear'],
      correctIndex: 1,
      explanation:
          'The Blue Whale is the largest animal ever known to have existed.',
    ),
    Question(
      question: 'In which year did World War II end?',
      options: ['1943', '1944', '1945', '1946'],
      correctIndex: 2,
      explanation: 'World War II ended in 1945 with the surrender of Japan.',
    ),
    Question(
      question: 'What is the chemical symbol for gold?',
      options: ['Go', 'Au', 'Gd', 'Ag'],
      correctIndex: 1,
      explanation: 'Au comes from the Latin word "aurum" meaning gold.',
    ),
    Question(
      question: 'Which country is home to the kangaroo?',
      options: ['New Zealand', 'Australia', 'South Africa', 'Brazil'],
      correctIndex: 1,
      explanation: 'Kangaroos are native to Australia.',
    ),
    Question(
      question: 'What is the tallest mountain in the world?',
      options: ['K2', 'Kangchenjunga', 'Mount Everest', 'Lhotse'],
      correctIndex: 2,
      explanation:
          'Mount Everest stands at 8,849 meters (29,032 feet) above sea level.',
    ),
    Question(
      question: 'How many hearts does an octopus have?',
      options: ['1', '2', '3', '4'],
      correctIndex: 2,
      explanation:
          'An octopus has three hearts: two pump blood to the gills, one pumps it to the body.',
    ),
    Question(
      question: 'What is the currency of Japan?',
      options: ['Yuan', 'Won', 'Yen', 'Ringgit'],
      correctIndex: 2,
      explanation: 'The Yen (¥) is the official currency of Japan.',
    ),
    Question(
      question: 'Which gas do plants absorb from the atmosphere?',
      options: ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
      correctIndex: 2,
      explanation:
          'Plants absorb CO2 during photosynthesis to produce oxygen and glucose.',
    ),
    Question(
      question: 'What is the longest river in the world?',
      options: [
        'Amazon River',
        'Nile River',
        'Yangtze River',
        'Mississippi River',
      ],
      correctIndex: 1,
      explanation: 'The Nile River is approximately 6,650 km long.',
    ),
  ],
  'Technology': [
    Question(
      question: 'Who developed Flutter?',
      options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
      correctIndex: 1,
      explanation:
          'Flutter is an open-source UI framework developed by Google.',
    ),
    Question(
      question: 'What does CPU stand for?',
      options: [
        'Central Performance Unit',
        'Central Processing Unit',
        'Control Panel Unit',
        'Computer Power Unit',
      ],
      correctIndex: 1,
      explanation:
          'CPU is the primary component that executes instructions in a computer.',
    ),
    Question(
      question: 'What does HTML stand for?',
      options: [
        'Hyper Text Markup Language',
        'High Tech Modern Language',
        'Home Tool Markup Language',
        'Hyperlinks and Text Markup Language',
      ],
      correctIndex: 0,
      explanation:
          'HTML is the standard markup language for creating web pages.',
    ),
    Question(
      question:
          'Which programming language is known as the "language of the web"?',
      options: ['Python', 'JavaScript', 'Java', 'C++'],
      correctIndex: 1,
      explanation:
          'JavaScript runs in web browsers and is essential for interactive websites.',
    ),
    Question(
      question: 'What does RAM stand for?',
      options: [
        'Random Access Memory',
        'Read And Modify',
        'Run All Memory',
        'Rapid Access Module',
      ],
      correctIndex: 0,
      explanation:
          'RAM is volatile memory used to store data temporarily while a computer is running.',
    ),
    Question(
      question: 'Who is the founder of Microsoft?',
      options: ['Steve Jobs', 'Bill Gates', 'Mark Zuckerberg', 'Elon Musk'],
      correctIndex: 1,
      explanation: 'Bill Gates co-founded Microsoft with Paul Allen in 1975.',
    ),
    Question(
      question: 'What does USB stand for?',
      options: [
        'Universal Serial Bus',
        'United System Bus',
        'Universal System Board',
        'Uniform Serial Board',
      ],
      correctIndex: 0,
      explanation:
          'USB is an industry standard for connecting peripherals to computers.',
    ),
    Question(
      question: 'Which company owns Android?',
      options: ['Apple', 'Samsung', 'Google', 'Huawei'],
      correctIndex: 2,
      explanation:
          'Google acquired Android Inc. in 2005 and developed the Android OS.',
    ),
    Question(
      question: 'What is the main function of an operating system?',
      options: [
        'Browse the internet',
        'Manage hardware and software',
        'Edit documents',
        'Play games',
      ],
      correctIndex: 1,
      explanation: 'An OS manages computer hardware and software resources.',
    ),
    Question(
      question: 'What does AI stand for?',
      options: [
        'Automatic Intelligence',
        'Artificial Intelligence',
        'Advanced Interface',
        'Automated Information',
      ],
      correctIndex: 1,
      explanation:
          'AI refers to the simulation of human intelligence in machines.',
    ),
    Question(
      question: 'Which storage device is fastest?',
      options: ['HDD', 'SSD', 'CD-ROM', 'Floppy Disk'],
      correctIndex: 1,
      explanation:
          'SSDs use flash memory and are much faster than traditional HDDs.',
    ),
    Question(
      question: 'What does GPU stand for?',
      options: [
        'General Processing Unit',
        'Graphics Processing Unit',
        'Gaming Performance Unit',
        'Global Processing Unit',
      ],
      correctIndex: 1,
      explanation:
          'GPUs are specialized processors designed for rendering graphics.',
    ),
    Question(
      question: 'Which protocol is used to send email?',
      options: ['HTTP', 'FTP', 'SMTP', 'DNS'],
      correctIndex: 2,
      explanation:
          'SMTP (Simple Mail Transfer Protocol) is used for sending emails.',
    ),
    Question(
      question: 'What is the most popular version control system?',
      options: ['SVN', 'Git', 'Mercurial', 'CVS'],
      correctIndex: 1,
      explanation:
          'Git is widely used for tracking changes in source code during development.',
    ),
    Question(
      question: 'What does VPN stand for?',
      options: [
        'Virtual Private Network',
        'Very Personal Network',
        'Visual Private Node',
        'Virtual Public Network',
      ],
      correctIndex: 0,
      explanation:
          'A VPN creates a secure, encrypted connection over the internet.',
    ),
  ],
  'Science': [
    Question(
      question: 'What is the chemical formula for water?',
      options: ['H2O', 'CO2', 'O2', 'H2O2'],
      correctIndex: 0,
      explanation: 'Water consists of two hydrogen atoms and one oxygen atom.',
    ),
    Question(
      question: 'What is the speed of light?',
      options: ['300,000 km/s', '150,000 km/s', '450,000 km/s', '600,000 km/s'],
      correctIndex: 0,
      explanation: 'Light travels at approximately 299,792 km/s in a vacuum.',
    ),
    Question(
      question: 'How many bones are in the adult human body?',
      options: ['186', '206', '226', '246'],
      correctIndex: 1,
      explanation: 'An adult human skeleton typically has 206 bones.',
    ),
    Question(
      question: 'What is the largest organ in the human body?',
      options: ['Heart', 'Brain', 'Liver', 'Skin'],
      correctIndex: 3,
      explanation: 'The skin is the largest organ, covering the entire body.',
    ),
    Question(
      question: 'What force keeps planets in orbit around the sun?',
      options: ['Magnetism', 'Gravity', 'Friction', 'Electricity'],
      correctIndex: 1,
      explanation:
          'Gravity is the force that attracts objects toward each other.',
    ),
    Question(
      question: 'What is the powerhouse of the cell?',
      options: ['Nucleus', 'Ribosome', 'Mitochondria', 'Chloroplast'],
      correctIndex: 2,
      explanation: 'Mitochondria generate most of the cell\'s energy (ATP).',
    ),
    Question(
      question: 'What is the atomic number of carbon?',
      options: ['4', '6', '8', '12'],
      correctIndex: 1,
      explanation: 'Carbon has 6 protons, giving it an atomic number of 6.',
    ),
    Question(
      question: 'What type of blood cells fight infection?',
      options: ['Red blood cells', 'White blood cells', 'Platelets', 'Plasma'],
      correctIndex: 1,
      explanation:
          'White blood cells (leukocytes) defend the body against infections.',
    ),
    Question(
      question: 'What is the study of earthquakes called?',
      options: ['Meteorology', 'Geology', 'Seismology', 'Volcanology'],
      correctIndex: 2,
      explanation:
          'Seismology is the scientific study of earthquakes and seismic waves.',
    ),
    Question(
      question: 'Which planet has the most moons?',
      options: ['Jupiter', 'Saturn', 'Uranus', 'Neptune'],
      correctIndex: 1,
      explanation:
          'Saturn has the most confirmed moons with over 140 discovered.',
    ),
    Question(
      question: 'What is the boiling point of water at sea level?',
      options: ['90°C', '95°C', '100°C', '105°C'],
      correctIndex: 2,
      explanation:
          'Water boils at 100°C (212°F) at standard atmospheric pressure.',
    ),
    Question(
      question: 'What is the most abundant gas in Earth\'s atmosphere?',
      options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Argon'],
      correctIndex: 2,
      explanation: 'Nitrogen makes up about 78% of Earth\'s atmosphere.',
    ),
    Question(
      question: 'How long does it take for light from the Sun to reach Earth?',
      options: ['8 seconds', '8 minutes', '8 hours', '8 days'],
      correctIndex: 1,
      explanation:
          'Sunlight takes approximately 8 minutes and 20 seconds to reach Earth.',
    ),
    Question(
      question: 'What is the hardest natural substance on Earth?',
      options: ['Gold', 'Iron', 'Diamond', 'Platinum'],
      correctIndex: 2,
      explanation: 'Diamond is the hardest naturally occurring material.',
    ),
    Question(
      question: 'What is the process by which plants make food?',
      options: ['Respiration', 'Photosynthesis', 'Digestion', 'Fermentation'],
      correctIndex: 1,
      explanation:
          'Photosynthesis converts light energy into chemical energy stored in glucose.',
    ),
  ],
};

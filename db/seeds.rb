User.delete_all
Department.delete_all
Course.delete_all
Section.delete_all
Period.delete_all
Enrollment.delete_all

User.create!([
  {first_name: "Blanche", last_name: "DuBois", email: "blachebudois@cps.edu", id_number: 3223, current_homeroom: "Mr.Keating", password: "123", admin: false, grade_level: 11},
  {first_name: "Anna", last_name: "Karenina", email: "annakarenina@cps.edu", id_number: 3766, current_homeroom: "Mr.Keating", password: "123", admin: false, grade_level: 11},
  {first_name: "Carrie", last_name: "White", email: "carriewhite@cps.edu", id_number: 9121, current_homeroom: "Mr.Keating", password: "123", admin: false, grade_level: 12},
  {first_name: "Hermione", last_name: "Granger", email: "hermionegranger@cps.edu", id_number: 3754, current_homeroom: "Mr. Kotter", password: "123", admin: false, grade_level: 9},
  {first_name: "Juan", last_name: "Epstein", email: "juanepstein@cps.edu", id_number: 1098, current_homeroom: "Mr. Kotter", password: "123", admin: false, grade_level: 10},
  {first_name: "Arnold", last_name: "Horschack", email: "arnoldhorshack@cps.edu", id_number: 4323, current_homeroom: "Mr. Kotter", password: "123", admin: false, grade_level: 11},
  {first_name: "Vinnie", last_name: "Barbarino", email: "vinniebarbarino@cps.edu", id_number: 8856, current_homeroom: "Mr. Kotter", password: "123", admin: false, grade_level: 12},
  {first_name: "Test", last_name: "One", email: "testone@cps.edu", id_number: 2288, current_homeroom: "Mr. Hand", password: "123", admin: false, grade_level: 10},
  {first_name: "Test", last_name: "Two", email: "testtwo@cps.edu", id_number: 5343, current_homeroom: "Mr. Hand", password: "123", admin: false, grade_level: 11},
  {first_name: "Bob", last_name: "Tester", email: "bobtester@cps.edu", id_number: 7665, current_homeroom: "Mr. Hand", password: "123", admin: false, grade_level: 12},
  {first_name: "Arnold", last_name: "Hand", email: "arnoldhand@cps.edu", id_number: 9876, current_homeroom: "LH 215", password: "123", admin: true, grade_level: 99},
  {first_name: "John", last_name: "Keating", email: "johnkeating@cps.edu", id_number: 2351, current_homeroom: "DH 215", password: "123", admin: true, grade_level: 99},
  {first_name: "Gabe", last_name: "Kotter", email: "gabekotter@cps.edu", id_number: 7208, current_homeroom: "BSB 137", password: "123", admin: true, grade_level: 99},
  {first_name: "Elisabeth", last_name: "Halsey", email: "elizabethhalsey@cps.edu", id_number: 2232, current_homeroom: "UH 435", password: "123", admin: true, grade_level: 99}
])

Department.create!([
  {name: "Art"},
  {name: "Math"},
  {name: "Science"},
  {name: "Individuals and Society"},
  {name: "Language Acquisition"},
  {name: "English"},
  {name: "Physical Education"},
  {name: "General"}
  ])

Course.create!([
  {name: "ART 410", number: "0410ART", title: "Advanced Figure Studies", description: "Study of the human body and it's form", prereq: "0390ART", department_id: 1, diploma_program: true},
  {name: "MTH 401", number: "0401MTH", title: "Calculus I", description: "Introduction to Calculus", prereq: "0383MTH", department_id: 2, diploma_program: true},
  {name: "SCI 101", number: "0101SCI", title: "Geology I", description: "Introduction to Geology", prereq: "none", department_id: 3, diploma_program: false},
  {name: "IAS 271", number: "0271IAS", title: "Current World Leaders", description: "Comparison of major modern world leaders", prereq: "0154IAS", department_id: 4, diploma_program: true},
  {name: "RUS 215", number: "0215LAS", title: "Intermediate Russian", description: "Introduction to translating texts", prereq: "0115LAS", department_id: 5, diploma_program: false},
  {name: "ENG 101", number: "0101ENG", title: "English Composition", description: "Really fun essay writing, and super interesting readings to prepare you for a wonderful career as a worker bee.", prereq: "none", department_id: 6, diploma_program: false},
  {name: "PED 300", number: "0300PED", title: "Junior Physical Education", description: "Stretching, sweating before class, feeling uncomfortable amongst peers", prereq: "0200PED", department_id: 7, diploma_program: false},
  {name: "LNC 000", number: "0000GEN", title: "Lunch", description: "Time to eat", prereq: "none", department_id: 8, diploma_program: false}
  ])

Section.create!([
  {name: "Figures in athletics", code: "0410ART-8", description: "Focus into muscular structure of the human form. Studies into representing figures in motion. Sorry guys, no nudes.", seats: 4, course_id: 1, period_id: 8, closed: false },
  {name: "Lunch", code: "0000LNC-7", description: "Time for teens to eat. We hope you are into whole foods and real nutrition, but we understand the Sweedish Fish and Cheese-Nips washed down with grape soda.", seats: 4, course_id: 8, period_id: 7, closed: false },
  {name: "Rocks for Jocks", code: "0101SCI-6", description: "Basic study of rock formations, striations within layers of the earth, minimal labwork to ensure athletes remain on the team.", seats: 4, course_id: 3, period_id: 6, closed: false },
  {name: "Politicians, Warlords, and the Money Controllers", code: "IAS 271-5", description: "Analysis into the characters that shape the political climate of today's world. Explorations into the power of fear, money control and political power.", seats: 4, course_id: 4, period_id: 5, closed: false },
  {name: "Mittens, Wolves and Snow", code: "0215LAS-4", description: "Translation of traditional Russian fairy tales. Study of advanced vocabulary, idioms and the concept of suffering through salvation.", seats: 4, course_id: 5, period_id: 4, closed: false },
  {name: "Essays and Composition", code: "0101ENG-3", description: "Increadibly droll readings and the essays that ensue from forcing yourself to read such readings. Preparing yourself for a life as a worker bee.", seats: 4, course_id: 6, period_id: 3, closed: false },
  {name: "Junior PE", code: "0300PED-2", description: "Practice with team work and hand eye coordination. Sweating before class, feeling uncomfortable amongst peers and establishing a pecking order based on physicality.", seats: 4, course_id: 7, period_id: 2, closed: false },
  {name: "Beginning Calculus", code: "0401MTH-1", description: "Exploration into functions, dirivitives and advanced graphing. Teaching young academics to deal with the stress of really hard problems and confusing syntax.", seats: 4, course_id: 2, period_id: 1, closed: false }
  ])

Period.create!([
  {name: "First"},
  {name: "Second"},
  {name: "Third"},
  {name: "Fourth"},
  {name: "Fifth"},
  {name: "Sixth"},
  {name: "Seventh"},
  {name: "Eighth"},
  {name: "Homeroom"}
  ])

Enrollment.create!([
  {student_id: 1, section_id: 1, semester: "Fall", active: true},
  {student_id: 2, section_id: 2, semester: "Fall", active: true},
  {student_id: 3, section_id: 3, semester: "Fall", active: true},
  {student_id: 4, section_id: 4, semester: "Fall", active: true},
  {student_id: 5, section_id: 5, semester: "Fall", active: true},
  {student_id: 6, section_id: 6, semester: "Fall", active: true},
  {student_id: 7, section_id: 7, semester: "Fall", active: true},
  {student_id: 8, section_id: 8, semester: "Fall", active: true},
  {student_id: 9, section_id: 8, semester: "Fall", active: true},
  {student_id: 10, section_id: 8, semester: "Fall", active: true}
  ])
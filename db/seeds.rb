# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courses = [
  'Scrum Master Certification',
  'Leading SAFe 5.0',
  'DevOps',
  'Business Analyst',
  'Project Management',
  'Data Science',
  'Cloud Computing',
  'JavaScript',
  'CSS/HTML',
  'Cyber Security',
  'Digital Marketing',
  'Python', 
  'Big Data',
  'Automation Testing',
  'ITIL 4 Foundation',
  'Splunk',
  'Service Now',
  'Quality Analyst',
  'Tableau'
]

course_descriptions =  {
  scrummastercertification: "A scrum master is the facilitator for an agile development team. Scrum is a methodology that allows a team to self-organize and make changes quickly, in accordance with agile principles. The scrum master manages the process for how information is exchanged.",
  :"leadingsafe5.0" => "SAFe 5.0 features seven core competencies, which represent the stepping stones to business agility.",
  devops: "DevOps is a set of practices that combines software development and IT operations. It aims to shorten the systems development life cycle and provide continuous delivery with high software quality.",
  businessanalyst: "Business Analysts conduct market analyses, analysing both product lines and the overall profitability of the business",
  projectmanagement: "Project management is the practice of leading the work of a team to achieve goals and meet success criteria at a specified time.",
  datascience: "Data science is an inter-disciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from many structural and unstructured data.",
  cloudcomputing: "Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user.",
  javascript: "JavaScript (JS) is a lightweight, interpreted, or just-in-time compiled programming language with first-class functions. While it is most well-known as the scripting language for Web pages, many non-browser environments also use it, such as Node.js, Apache CouchDB and Adobe Acrobat.",
  :"css/html" => "HTML, HyperText Markup Language, gives content structure and meaning by defining that content as, for example, headings, paragraphs, or images. CSS, or Cascading Style Sheets, is a presentation language created to style the appearance of content—using, for example, fonts or colors,",
  cybersecurity: "Cyber security is the practice of defending computers, servers, mobile devices, electronic systems, networks, and data from malicious attacks. It is also known as information technology security or electronic information security.",
  digitalmarketing: "Digital marketing is the component of marketing that utilizes internet and online based digital technologies such as desktop computers, mobile phones and other digital media and platforms to promote products and services.",
  python: "Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Python is simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance", 
  bigdata: "Big data refers to the large, diverse sets of information that grow at ever-increasing rates. It encompasses the volume of information, the velocity or speed at which it is created and collected, and the variety or scope of the data points being covered.",
  automationtesting: "Automated testing or test automation is a method in software testing that makes use of special software tools to control the execution of tests and then compares actual test results with predicted or expected results",
  itil4foundation: "The Foundation level is designed as an introduction to ITIL 4 and enables candidates to look at IT service management through a BRAND NEW end-to-end operating model for the creation, delivery and continual improvement of tech-enabled products and services.",
  splunk: "Splunk captures, indexes, and correlates real-time data in a searchable repository from which it can generate graphs, reports, alerts, dashboards, and visualizations.",
  servicenow: "ServiceNow is a Platform-as-a-service provider, providing technical management support, such as IT service management, to the IT operations of large corporations, including providing help desk functionality.",
  qualityanalyst: "The Quality Analyst is responsible for developing and supporting the planning, design, and execution of test plans, test scripts, and process plans for projects",
  tableau: "Tableau is the fastest growing data visualization tool that aims to help people see and understand data. In order to transform the way people use data to solve problems, tableau software ensures to meet strict requirements. In other words, it simply converts raw data into a very easily understandable format."
}

course_count = 0

courses.each do |course|
   Course.find_or_create_by(name: course, description: course_descriptions[course.gsub(' ', '').downcase.to_sym] )
   course_count += 1
end
puts "#{course_count} courses created"
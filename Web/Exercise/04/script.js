const user = {
    name: "Piyush Sharma",
    designation: "Senior Software Engineer",
    company: "Infuse Consulting",
    hobbies: ["Reading", "Listening to music", "Collecting stamps"]
}

const printUserProfile = ({name, designation, company, hobbies}) => {
    let str = "";
    if (hobbies.length == 1) {
        str = hobbies[0];
    }
    else {
        for (let i = 0; i < hobbies.length; i++) {
            if (i == hobbies.length - 1) {
                str += "and " + hobbies[i];
            }
            else {
                str = hobbies[i] + ", "
            }
        }
    }
    console.log(`${name} is a ${designation} at ${company}. He likes ${str}.`);
}

printUserProfile(user);


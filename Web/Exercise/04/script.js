const user = {
    name: "Piyush Sharma",
    designation: "Senior Software Engineer",
    company: "Infuse Consulting",
    hobbies: ["Reading", "Listening to music", "Collecting stamps"]
}

/**
 * Use destructuting to log the following
*/

const printUserProfile = ({name, designation, company, hobbies}) => {
    const [hobbies1, hobbies2, hobbies3] = hobbies;
    // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps
    console.log(name + " is a " + designation + " at " + company + ". He likes " + hobbies1 + ", " + hobbies2 + " and " + hobbies3);
}

printUserProfile(user);


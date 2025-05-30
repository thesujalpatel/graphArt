#!/bin/bash
set -e

# Clone or create repo
git clone https://github.com/thesujalpatel/graphArt.git gitgenix || {
  echo 'Repo not found. Creating new repo folder...';
  mkdir gitgenix && cd gitgenix && git init && touch README.md && git add . && git commit -m "Initial commit"
} && cd gitgenix

touch log.txt
dates=("2004-04-06T00:00:00.000Z" "2004-04-07T00:00:00.000Z" "2004-04-08T00:00:00.000Z" "2004-04-10T00:00:00.000Z" "2004-04-13T00:00:00.000Z" "2004-04-15T00:00:00.000Z" "2004-04-17T00:00:00.000Z" "2004-04-20T00:00:00.000Z" "2004-04-22T00:00:00.000Z" "2004-04-24T00:00:00.000Z" "2004-04-27T00:00:00.000Z" "2004-04-29T00:00:00.000Z" "2004-04-30T00:00:00.000Z" "2004-05-01T00:00:00.000Z" "2004-05-11T00:00:00.000Z" "2004-05-12T00:00:00.000Z" "2004-05-13T00:00:00.000Z" "2004-05-14T00:00:00.000Z" "2004-05-15T00:00:00.000Z" "2004-05-22T00:00:00.000Z" "2004-05-29T00:00:00.000Z" "2004-06-01T00:00:00.000Z" "2004-06-02T00:00:00.000Z" "2004-06-03T00:00:00.000Z" "2004-06-04T00:00:00.000Z" "2004-06-05T00:00:00.000Z" "2004-06-15T00:00:00.000Z" "2004-06-18T00:00:00.000Z" "2004-06-19T00:00:00.000Z" "2004-06-22T00:00:00.000Z" "2004-06-26T00:00:00.000Z" "2004-06-29T00:00:00.000Z" "2004-06-30T00:00:00.000Z" "2004-07-01T00:00:00.000Z" "2004-07-02T00:00:00.000Z" "2004-07-03T00:00:00.000Z" "2004-07-06T00:00:00.000Z" "2004-07-20T00:00:00.000Z" "2004-07-21T00:00:00.000Z" "2004-07-22T00:00:00.000Z" "2004-07-23T00:00:00.000Z" "2004-07-24T00:00:00.000Z" "2004-07-27T00:00:00.000Z" "2004-07-29T00:00:00.000Z" "2004-08-03T00:00:00.000Z" "2004-08-05T00:00:00.000Z" "2004-08-10T00:00:00.000Z" "2004-08-11T00:00:00.000Z" "2004-08-12T00:00:00.000Z" "2004-08-13T00:00:00.000Z" "2004-08-14T00:00:00.000Z" "2004-08-24T00:00:00.000Z" "2004-08-25T00:00:00.000Z" "2004-08-26T00:00:00.000Z" "2004-08-27T00:00:00.000Z" "2004-08-28T00:00:00.000Z" "2004-09-04T00:00:00.000Z" "2004-09-11T00:00:00.000Z" "2004-09-18T00:00:00.000Z")

messages=("Dream big. Start small." "Code with courage." "Every dot counts." "Trust the process." "Progress over perfection." "Pixel by pixel." "Build boldly." "Keep showing up." "You are the spark." "Create with heart." "Break limits." "Make it happen." "Stay hungry." "Mind on the mission." "Driven by passion." "Keep the fire alive." "From idea to impact." "It’s your move." "Commit with purpose." "Just keep shipping." "Rise and build." "Art in every commit." "Consistency wins." "No shortcuts." "Push beyond." "You were born to build." "Chase mastery." "Leave a mark." "Built not born." "Grind. Grow. Glow." "Code your legacy." "Purpose fuels power." "Never stop learning." "Bold steps only." "Good things take time." "Your work matters." "Own the outcome." "Step into greatness." "Every line matters." "The art of discipline." "Write. Refactor. Win." "Keep moving forward." "Elevate daily." "Think bigger." "Greatness is built." "Find your rhythm." "Hustle with heart." "Build something that lasts." "Perfection is progress." "Focus. Finish. Fly." "Excellence is a habit." "Stay in motion." "Build with love." "Passion powers progress." "This is your time." "Stay curious." "One more push." "Brick by brick." "You are the code artist.")

for ((j=0; j<24; j++)); do
    for i in "${!dates[@]}"; do
        export GIT_AUTHOR_DATE="${dates[i]}"
        export GIT_COMMITTER_DATE="${dates[i]}"
        echo "${messages[i]}" >> log.txt
        git add "log.txt"
        git commit -m "${messages[i]}"

    done
done


# Set remote and push
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/thesujalpatel/graphArt.git
git branch -M main
git push -u origin main

# Cleanup
cd ..
rm -rf gitgenix
echo 'Graph ready! Push complete.'
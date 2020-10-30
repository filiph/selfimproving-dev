As a developer, there are hundreds of skills you can add to your belt.
Front end, back end, ML, big data, databases, micro-controllers, CI, and
so on. All of these are interesting and each of them brings exciting new
career opportunities, or at least fun diversions.

Today, I’m here to say that good old *data mining*, despite being one of
the less talked about skills, is one of the most powerful and widely
applicable disciplines. Data mining can help you with anything from
getting the best deal on your car to proving your worth to your employer
to finding a once-in-a-lifetime business opportunity.

I’m using the term “data mining” loosely here. For me, it encompasses
everything from getting data, to analyzing it, to summarizing everything
into some useful nugget of information.

-   **Manual data entry.** This is the least technical discipline, but
    sometimes the most pragmatic. Often, all you have to do is to spend
    the time, manually going through some PDF or website, and putting
    the relevant data into some spreadsheet or database. If it’s a few
    hours of your time, it’s completely fine (and sometimes educational)
    to do it yourself. If it’s more, and you have some money to spend, I
    encourage you to give this task to someone else. Someone who might
    need the work and the money more than you do. If you don’t have a
    person like this in your social circle, use
    [Fiverr](https://www.fiverr.com/categories/business/data-entry) or
    [Upwork](https://www.upwork.com/hire/data-entry-specialists/).
-   **Hunting for the right data files.** There are thousands of really
    interesting data files lying around the internet, and most are for
    free. It’s just a matter of knowing how to find them, and how to
    discern the useful ones from the rest. For example, there are zip
    files with all the current articles on Wikipedia, all the questions
    on StackOverflow, or all the current satellite images of the Earth.
-   **Using web APIs.** Many services have data APIs you can tap into.
    It’s often a matter of writing a short script, less than 200 lines
    of code, and you have a bespoke tool for exactly what you need. This
    tool can run as often as you want, for as long as you want. You
    could be keeping your finger on the pulse of Reddit, or HackerNews,
    or YouTube. You could be analyzing price curves of your favorite
    items on Amazon.
-   **Scraping.** Often, the data is out there, but it’s not in
    machine-readable files nor accessible through APIs. Instead, it’s in
    human-readable documents. And there are way too many of them for
    manual data entry to be viable. Scraping lets you look at these
    documents programatically. It can be as primitive as filtering some
    HTML files with a regular expression, or as high-tech as using AI to
    OCR thousands of scanned PDFs. In between those extremes, there are
    services such as [DataMiner](https://data-miner.io/).
-   **Database creation.** Now that you have the data, you need to
    figure out how to represent it for your needs. Is it going to be a
    simple online spreadsheet? (I recommend this approach — it’s the
    least exciting, but the most accessible and often “good enough”.) Is
    it going to be a CSV file? A pandas pickle? A Postgres database? How
    will it be structured? Since this is data mining and not a
    production backend, the pressure is generally much lower on finding
    the best possible solution. But it’s still important.
-   **Analysis.** Last but definitely not least, you need to extract
    some insights (useful information) from all that data. This is, of
    course, a discipline in and of itself. You could go all the way,
    learning advanced statistics, delving into visualization, and so on.
    But for many projects, all you really need is to show a graph or
    two, and do some simple statistics like averages or medians.

Examples
--------

Most recently, I used the API approach to get data from YouTube, to find
out how many people viewed the YouTube videos which I scripted or in
which I appeared. This was a fun little exercise with a lot of value for
me (making YouTube videos is part of my job, and viewership is one of
the signals to track).

In April, I combined several datasets to learn which time it makes most
sense to have a live stream if your audience is distributed around the
world the way developers are. (That is to say, not uniformly, but in
clusters around US Coasts, Brazil, EU, India, China, etc.) I
[tweeted](https://twitter.com/filiphracek/status/1255743296288157696)
the result, if you’re interested.

<img src="images/data-mining-screenshots/EW1I22dUYAAK8LN.png" title="EW1I22dUYAAK8LN.png" width="599" height="277" alt="A graph of timezones" />

Not too long ago, also this year, I had a need for a bespoke tool that
would give me writing inspiration for sword & sorcery prose. I had a
bunch of highlights in Kindle. I paid a person to extract and lightly
categorize those highlights, then put it all into a SQLite database, and
wrote a tiny desktop app to access it.

<img src="images/data-mining-screenshots/Screenshot-of-the-bespoke-app.png" title="Screenshot of the bespoke app.png" width="470" height="600" alt="Screen Shot 2020 08 26 at 11 11 18 PM" />

Now this app sits in my MacBook dock alongside such software as VS Code
or Chrome or Evernote, and it gets more use than some of the other ones.

A few years ago I was buying our family’s first car. Me being me, I went
all analytical on the task of choosing the right one, weighing such
things as Total Cost of Ownership, TÜV reliability index, gas mileage,
or average depreciation curve. I am not a car lover, so I had almost
zero emotion in the game, and just wanted not to waste money. (As they
say, car purchase can be one of the worst financial decisions a person
can make.) All this was a substantial amount of work, but I enjoyed most
of it, I learned a lot, and I’m convinced our family saved well above
$5K while still ending up with a good, reliable car.

Summary
-------

Data mining can help with anything from hobby projects to startup
business plans. It spans many disciplines, so it’s seldom boring, and
can be actually quite fun. If you’re thinking about learning a new
skill, you should seriously consider data mining.

The best way to learn data mining is to

1.  Learn the absolute basics, and then …
2.  … start a project and learn the rest by doing.

Have fun!

-- a fitness and fashion lifestyle blog

-- main.lua

-- define global variables
local blogTitle = "A Fitness and Fashion Lifestyle Blog"
local baseURL = "https://example.com/blog/"

-- define page store
local pageStore = {
  title = blogTitle,
  baseURL = baseURL
}

-- define page functions

-- postPage()
-- render a blog post page
function pageStore.postPage(title, author, content)
  local html = ""
  html = html .. "<html>\n"
  html = html .. "<head>\n"
  html = html .. "<title> " .. title .. " </title>\n"
  html = html .. "<base href='" .. baseURL .. "'>\n"
  html = html .. "</head>\n"
  html = html .. "<body>\n"
  html = html .. "<h1>" .. title .. "</h1>\n"
  html = html .. "<p> Written by " .. author .. "</p>\n"
  html = html .. content
  html = html .. "</body>\n"
  html = html .. "</html>\n"
  return html
end

-- indexPage()
-- render an index page for all blog posts
function pageStore.indexPage(posts)
  local html = ""
  html = html .. "<html>\n"
  html = html .. "<head>\n"
  html = html .. "<title> " .. blogTitle .. " </title>\n"
  html = html .. "<base href='" .. baseURL .. "'>\n"
  html = html .. "</head>\n"
  html = html .. "<body>\n"
  html = html .. "<h1>" .. blogTitle .. "</h1>\n"
  html = html .. "<ul>\n"
  for key,post in pairs(posts) do
    html = html .. "<li><a href='" .. post.url .. "'>" .. post.title .. "</a></li>\n"
  end
  html = html .. "</ul>\n"
  html = html .. "</body>\n"
  html = html .. "</html>\n"
  return html
end

-- define blog post data
local posts = {}
posts[1] = {
  title = "How to Stay Fit and Look Great",
  url = "fitness-look-great/",
  author = "John Doe",
  content = "<h2>Exercise</h2>\n<p>Regular exercise is essential for physical health and mental wellbeing. Working out increases your energy, reduces stress, and can help you stay in shape. Aim for at least 30 minutes of aerobic exercise, three to five times a week.</p>\n<h2>Healthy Eating</h2>\n<p>Eating a balanced diet is key to staying fit and looking good. Eat plenty of fresh fruits and vegetables, and make sure to get enough protein. Limit your intake of saturated fats, added sugars, and processed foods.</p>\n<h2>Fashion</h2>\n<p>Fashion doesn't have to be expensive. You can look great by mixing pieces from your existing wardrobe with a few key pieces from the latest trends. Look for pieces that flatter your body shape, and experiment with different colours and styles.</p>"
}

posts[2] = {
  title = "The Benefits of Yoga",
  url = "benefits-of-yoga/",
  author = "Jane Doe",
  content = "<h2>Physical Benefits</h2>\n<p>Yoga strengthens and tones muscles, increases flexibility, and improves posture. It can help you lose weight and prevent injury. Regular practice can also reduce stress levels and improve sleep.</p>\n<h2>Mental Benefits</h2>\n<p>Yoga helps focus the mind and encourages relaxation. It can improve concentration and boost self-esteem. It can also help nurture mental and emotional wellbeing, and provide a sense of peace and calm.</p>\n<h2>Types of Yoga</h2>\n<p>There are many forms of yoga to choose from. Hatha yoga is a good starting point, as it focuses on physical poses. Ashtanga and Vinyasa are dynamic forms of yoga focusing on flow and movement. Restorative yoga is a gentle practice focusing on relaxation and healing.</p>"
}

-- render pages
local indexHTML = pageStore.indexPage(posts)
local post1HTML = pageStore.postPage(posts[1].title, posts[1].author, posts[1].content)
local post2HTML = pageStore.postPage(posts[2].title, posts[2].author, posts[2].content)

-- save pages to disk
local indexFile = io.open("index.html", "w")
indexFile:write(indexHTML)
indexFile:close()

local post1File = io.open(posts[1].url, "w")
post1File:write(post1HTML)
post1File:close()

local post2File = io.open(posts[2].url, "w")
post2File:write(post2HTML)
post2File:close()
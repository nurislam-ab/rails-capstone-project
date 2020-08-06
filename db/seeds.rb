categories = Category.create([
                               { id: 4,     name: 'Holidays', priority: 2 },
                               { id: 8,     name: 'Food news',      priority: 0 },
                               { id: 9,     name: 'How-tos',        priority: 0 },
                               { id: 11,    name: 'Reviews',        priority: 1 },
                               { id: 10,    name: 'Recipes',        priority: 2 },
                               { id: 3,     name: 'Media',          priority: 1 },
                               { id: 12,    name: 'Books',          priority: 6 }
                             ])

users = User.create([
                      { id: 8, email: 'email@mail.com', name: 'Name', surname: '', bio: '', website: '' },
                      { id: 4, email: 'malika@mail.com',   name: 'Malika', surname: 'Adams',       bio: 'Welcome to my 👑dom. Traveller ✈️ Book Lover 📖 Obsessed with tacos 🌮.\r\n👇 Check out my latest blog posts 👇', website: 'https://www.malika.com/' },
                      { id: 1, email: 'admin@mail.com',    name: 'Admin',  surname: 'Dashboard',   bio: '', website: '' },
                      { id: 5, email: 'christ@mail.com',   name: 'Christ', surname: 'Harris',      bio: 'Singer. Live in dreams. Finalist of "The Voice". Finished musical college in Sweden.\r\nLanguages: Swedish\, English\, French.', website: 'https://stay-com.herokuapp.com/' },
                      { id: 6, email: 'laziz@mail.com',    name: 'Laziz',  surname: 'Nasibov',     bio: 'No this isn’t a dream\, this is my reality. The best things come from living outside of your comfort zone\r\n\r\nDreams 👉 Goals', website: 'https://www.laziz.com' },
                      { id: 2, email: 'stone@mail.com',    name: 'Jason',  surname: 'Stone',       bio: 'Having the time of my life ⏰🎉', website: '' },
                      { id: 7, email: 'alex@mail.com',     name: 'alex',   surname: '',            bio: '', website: '' }
                    ])

articles = Article.create([
                      { id: 1,	author_id: 5,	title: 'The Best Electric Griddles for Crowd-Size Cooking',                             updated_at: '2020-08-03 15:10:30.745639', created_at: '2020-08-03 15:03:21.044093', category_id: 11, preview_text: 'A large griddle can make big-batch cooking for meals like brunch a lot easier. We tested a range of prices and designs to find our favorites (and also to suggest a nonelectric option for some situations).', text: 'content', image: 'placeholder-image.png' },
                      { id: 2,	author_id: 5,	title: 'The Cooking Gene, One Year Later: An Appreciation',	                            updated_at: '2020-08-03 15:11:48.838423', created_at: '2020-08-03 15:06:04.311482', category_id: 12, preview_text: "Michael W. Twitty's book The Cooking Gene belongs on every shelf. Its recent release in paperback provides an occasion to make the case.", text: 'content', image: 'placeholder-image.png' },
                      { id: 3,	author_id: 5,	title: 'Video recipe: butter dough samsa',                                              updated_at: '2020-08-03 15:13:15.718857', created_at:	'2020-08-03 10:53:29.792027', category_id: 10, preview_text: 'This type of samsa can hardly be called classic, but these lush and mouth-watering samsa with meat will definitely appeal to everyone.', text: 'content', image: 'placeholder-image.png' },
                      { id: 4,	author_id: 5,	title: 'The Top “Quarantine Recipes” Around the World, According to Pinterest',         updated_at: '2020-08-03 15:15:53.077388', created_at:   '2020-08-03 14:51:27.181636', category_id: 8,  preview_text: 'After collecting the top recipes, one major thing has become super clear: Pinners all over the world love bread — any kind of bread.', text: 'content', image: 'placeholder-image.png' },
                      { id: 5,	author_id: 5,	title: 'Obsession-Worthy Peanut Butter Cookie Ice Cream',                               updated_at: '2020-08-04 22:28:51.892841', created_at:   '2020-08-04 22:28:51.634243', category_id: 10, preview_text: 'Many years ago, I was reading a blog post by a blogger I’d been following for a while. ', text: 'content', image: 'placeholder-image.png' },
                      { id: 6,	author_id: 5,	title: 'Sleepy Morning Blender Matcha',	                                                updated_at: '2020-08-04 22:32:10.592558', created_at:   '2020-08-04 22:32:10.497832', category_id: 10, preview_text: 'At long last I’m able to give you a bit of an update on my recent health struggles! If you’re catching up, read this post and this post (and the comments) first.', text: 'content', image: 'placeholder-image.png' },
                      { id: 7,	author_id: 4,	title: 'Everything You Need to Know About Hanging (and Organizing) a Kitchen Pegboard', updated_at: '2020-08-04 22:47:38.7333',   created_at:   '2020-08-04 22:47:38.655369', category_id: 9,  preview_text: 'Back in March, we went a little pegboard crazy. And we still find it totally justifiable.', text: 'content', image: 'placeholder-image.png' },
                      { id: 8,	author_id: 2,	title: 'What to cook for your family at Hayit',	                                        updated_at: '2020-08-05 14:13:26.674082', created_at:   '2020-07-30 13:44:51.329102',	category_id: 4,  preview_text: 'Preview text', text: 'content', image: 'placeholder-image.png' },
                      { id: 9,	author_id: 2,	title: 'Plum crumble',                                                                  updated_at: '2020-08-05 14:16:36.892875', created_at:   '2020-08-05 14:16:36.694327', category_id: 10, preview_text: 'preview', text: 'content', image: 'placeholder-image.png' }
                    ])
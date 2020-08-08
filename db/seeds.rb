users = User.create([
    {id: 3	,email: 'hannah@mail.com'	,name: 'Hannah'	    ,surname: 'Abrams' ,bio: 'Welcome to my 👑dom. Traveller ✈️ Book Lover 📖 Obsessed with tacos 🌮\r\n👇 Check out my latest blog posts 👇', website: 'https://www.kitchenloop.com'},
    {id: 1	,email: 'admin@mail.com'	,name: 'admin'      ,surname: '',       website:'https://www.kitchenloop.com'},
    {id: 2	,email: 'nurislam@mail.com'	,name: 'Nurislam'   ,surname: '',	    website:'https://www.kitchenloop.com'},
    {id: 4	,email: 'adam@mail.com'	    ,name: 'Adam'       ,surname: '',		website:'https://www.kitchenloop.com'}
    ])
    
    categories = Category.create([
    {id: 2,	name:   "Books",        priority:	1},
    {id: 1,	name:	"Recipes",      priority:	1},
    {id: 3,	name:	"Reviews",      priority:	4},
    {id: 4,	name:	"HowTos",       priority:	3},
    {id: 5,	name:	"Food news",    priority:	2}
    ])
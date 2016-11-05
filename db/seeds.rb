# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create name: "Ardbeg Uigeadail",
               description: "Uigeadail derives from the Scotch Gaelic for 'Dark and Mysterious Place' and is named for the Loch from whence Ardbeg draws its waters. Jim Murray's 2009 World Whisky of the Year, this cask-strength bottle exudes breathtaking balance.",
               price: 5295

Product.create name: "Lagavulin 16 Year Old",
               description: "A much sought-after single malt with the massive peat-smoke that's typical of southern Islay - but also offering richness and a dryness that turns it into a truly interesting dram. The 16 year old has become a benchmark Islay dram from the Lagavulin distillery.",
               price: 4850

Product.create name: "Glenmorangie Signet",
               description: "A superb, beautifully packaged Glenmorangie. Signet is distilled from malt with a good portion of chocolate malt too. Chocolate malt is heavily roasted malted barley. Some of this whisky was also matured in virgin oak casks.",
               price: 12700

Product.create name: "Dalwhinnie 15 Year Old",
               description: "A great malt which Jim Murray awarded 95 points in his Whisky Bible, this is excellent value for money. The flavours are simple, but flawless, a clean, crisp 15 year old from the Dalwhinnie distillery, also part of Diageo's Classic Malts range.",
               price: 3428

Product.create name: "Auchentoshan 21 Year Old",
               description: "A 21 year old single malt, triple distilled and aged in second fill sherry casks, though nothing is lost to the power of the sherry. This bottling stands as the flagship for the core Auchentoshan range.",
               price: 11899

Product.create name: "Caol Ila 18 Year Old",
               description: "A wonderfully balanced expression from the core Caol Ila range, this 18 year old is malty and thick with notes of Caol Ila smoke and phenols, a lovely Islay single malt without extreme levels of peat.",
               price: 8249

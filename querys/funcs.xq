module namespace funcs = "funcs";

declare function funcs:filmsOrderByYearPage($page, $n,$syear, $fyear, $categories) as element()*
{
  <root>
  {
  let $cat := tokenize($categories, ' ')
  let $films := 
                for $film in collection('Films')//movie
                order by $film/year descending
                where $film/year >= $syear and $film/year <= $fyear
                for $genre in $film/genres//item
                where contains($cat, data($genre)) 
                return $film
  let $count := count($films)
                
  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};

declare function funcs:filmsOrderByYearPage($page, $n, $categories) as element()*
{
   <root>
  {
  let $cat := tokenize($categories, ' ')
  let $films := 
                for $film in collection('Films')//movie
                order by $film/year  descending
                for $genre in $film/genres//item
                where contains($cat, data($genre)) 
                return $film
  let $count := count($films)

  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};

declare function funcs:filmsOrderByYearPage( $page, $n, $syear, $fyear) as element()*
{
  <root>
  {
  let $films := 
                for $film in collection('Films')//movie
                order by $film/year descending
                where $film/year >= $syear and $film/year <= $fyear
                return $film
  let $count := count($films)
                
  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};

declare function funcs:filmsOrderByYearPage($page, $n) as element()*
{
   <root>
  {
  let $films := for $film in collection('Films')//movie
                order by $film/year descending
                return $film
  let $count := count($films)
  for $film in subsequence($films, $page*$n+1, $n)
  return 
         <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};







declare function funcs:filmsOrderByAlfaPage($page, $n,$syear, $fyear, $categories) as element()*
{
  <root>
  {
  let $cat := tokenize($categories, ' ')
  let $films := 
                for $film in collection('Films')//movie
                order by $film/original-title
                where $film/year >= $syear and $film/year <= $fyear
                for $genre in $film/genres//item
                where contains($cat, data($genre)) 
                return $film

  let $count := count($films)
  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};

declare function funcs:filmsOrderByAlfaPage($page, $n, $categories) as element()*
{
   <root>
  {
  let $cat := tokenize($categories, ' ')
  let $films := 
                for $film in collection('Films')//movie
                order by $film/original-title
                for $genre in $film/genres//item
                where contains($cat, data($genre)) 
                return $film
  let $count := count($films)
                
  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};

declare function funcs:filmsOrderByAlfaPage( $page, $n, $syear, $fyear) as element()*
{
  <root>
  {
  let $films := 
                for $film in collection('Films')//movie
                order by $film/original-title
                where $film/year >= $syear and $film/year <= $fyear
                return $film
  let $count := count($films)
                
  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};

declare function funcs:filmsOrderByAlfaPage($page, $n) as element()*
{
   <root>
  {
  let $films := for $film in collection('Films')//movie
                order by $film/original-title
                return $film
  let $count := count($films)
  for $film in subsequence($films, $page*$n+1, $n)
  return <elem>
          <count>{ $count }</count>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};



declare function funcs:getFilms() as element()*
{
  <root>
  {
  for $film in collection("Films")//movie
  return <elem>
          <id>{ data($film/imdbid) }</id>
          <title>{ data($film/original-title) }</title>
          <cover>{ data($film/cover-url) }</cover>
          <rating>{ data($film/rating) }</rating>
          <votes>{ data($film/votes) }</votes>
          <actors>{
            subsequence( $film/cast//name , 0, 5)
          }
          </actors>
          <directors>{
          subsequence( $film/directors//name , 0, 3)
        }
          </directors>
          <year>{ $film/year/text() }</year>
          <genres>{ subsequence( $film/genres//item , 0, 3) }</genres>
         </elem>
  }
  </root>
};



declare function funcs:getFilm($id) as element()
 {
   let $film := collection('Films')/movies/movie[@id=$id]
   return $film
   
 };
 
 


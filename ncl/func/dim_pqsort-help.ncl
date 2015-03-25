THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_pqsort.shtml
THE_TITLE:dim_pqsort
   NCL Home > Documentation > Functions > General applied math

dim_pqsort

   Computes the permutation vector generated by sorting the n - 1th (rightmost) dimension.

Prototype

        function dim_pqsort (
                x      : integer, float or double,
                kflag  : integer
        )

        return_val [dimsizes(x)] :  integer

Arguments

   x

   An integer, float, or double array of any dimensionality
   kflag

     * 2 - return the permutation vector resulting from sorting x in increasing order and sort x also.
     * 1 - return the permutation vector resulting from sorting x in increasing order and do not sort x.
     * -1 - return the permutation vector resulting from sorting x in decreasing order and do not sort x.
     * -2 - return the permutation vector resulting from sorting x in decreasing order and sort x also.

Return value

   Returns an integer array dimensioned the same size as x.

Description

   This function returns the permutation array generated by sorting the rightmost (n - 1th) dimension of the x array and,
   optionally, rearranging the elements of the array. The array will be sorted in increasing or decreasing order. A slightly
   modified quicksort algorithm is used.

   Ignoring missing values is not supported; they are sorted to either end of the array based on their actual value.

   The output permutation array will be the index of the value in the original order of the x array; that is, in the i-th
   location in the sorted order.

   Use dim_pqsort_n if you want to specify which dimension to do the average across.

See Also

   dim_pqsort_n, qsort, sqsort

Examples

   Example 1

   Let x be an array of length ntim. Generate a permutation vector in
     * ascending order, do not sort x:
ip = dim_pqsort(x, 1)
     * descending order, do not sort x:
ip = dim_pqsort(x, -1)
     * ascending order, sort x also:
ip = dim_pqsort(x, 2)
     * descending order, sort x also:
ip = dim_pqsort(x, -2)

   Example 2

   Define ip = dim_pqsort(x, 1) (ascending order, do not sort x) and it is desired to reorder a different array (say, y)
   using the permutation vector associated with x. Assume y(ntim, nlat, mlon) with named dimensions and coordinate variables
   "time", "lat" and "lon". Then:
  y2 = y                ; create yNew with attribute, coordinate values
  y2 = y(ip, :, :)      ; yNew will contain the values of "y"
                        ; rearranged according to the permutation
                        ; vector associated with x.
  y2&time = y&time(ip)  ; reorder the time coordinate variable

   Example 3

   Define x(ntim, nlat, mlon) with named dimensions "time","lat", "lon". Then:
  ip = dim_pqsort(x(lat|:, lon|:, time|:), 1) ; ===> ip(nlat, mlon, ntim)

  ip = dim_pqsort_n(x, 1, 0)                  ; no reordering needed

   Note: you need to be careful about reordering your array in the call to this function. As long as you don't want the
   function to reorder the original array itself, you should be okay.

   However, if you want the original array reordered, you will need to reorder the array and save it to a temporary
   variable, pass this temporary variable to the function, and then reorder the temporary variable again.

  xtmp = x(lat|:, lon|:, time|:)
  ip   = dim_pqsort(xtmp, 2) ; ===> ip(nlat, mlon, ntim)
  x    = xtmp(time|:, lat|:, lon|:)

   Or, preferrably, just use dim_pqsort_n:

  ip = dim_pqsort_n(x, 2, 0)                  ; no reordering needed

   Example 4

   Generate 1000 series of length 30 with unique ordering.
  random_setallseed(363738674, 918273645)   ; Set seeds (NOT required)

  nvals = 30
  narr  = 1000

;---Generate 1000 x 30 random numbers
  r = random_uniform(0,1,(/narr,nvals/))  ; random numbers

;---Sorting the values and keeping the indexes gives us random indexes.
  indexes = dim_pqsort(r, 1)             ; use in 30 element segments

;--- concise print for illustration
  do i=0,narr-1
    str = ""
    do j=0,nvals-1
      str = str + " " + indexes(i,j)
    end do
    print("" + str)
  end do

   Sample 'indexes'
(0)      15 16 22 18 23 5 21 12 3 17 0 1 8 11 9 4 20 25 28 2 13 6 27 24 19 26 14 7 29 10
(0)      1 7 25 9 21 29 8 14 20 11 16 4 5 22 19 23 12 0 27 18 28 24 15 13 26 3 6 17 2 10
(0)      14 29 4 20 18 22 27 3 24 25 0 9 28 12 6 7 1 15 26 10 23 5 21 19 13 11 17 8 2 16
(0)      28 27 1 10 2 0 5 23 4 21 18 17 22 29 13 16 11 26 6 24 15 9 19 14 25 20 3 7 12 8
(0)      20 2 12 11 22 17 25 19 15 4 16 6 18 23 9 13 8 1 27 29 5 28 3 0 14 21 7 24 26 10
(0)      4 15 25 8 10 28 16 21 26 0 14 6 27 24 18 22 7 2 13 17 11 23 9 5 19 20 29 3 12 1
(0)      2 7 0 28 10 26 24 19 13 20 29 25 17 14 23 18 27 6 3 5 1 21 16 4 15 9 22 11 12 8
(0)      17 15 11 24 27 12 14 1 22 6 9 21 5 0 29 28 23 13 3 16 25 8 26 2 20 4 19 10 18 7
(0)      3 15 27 2 6 21 17 28 16 11 18 26 13 9 24 19 5 8 12 14 7 1 20 25 23 22 0 29 10 4
[SNIP]


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
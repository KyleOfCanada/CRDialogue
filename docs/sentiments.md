### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs
sad](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/joySadPlot.png)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: right;">Joy</th>
<th style="text-align: right;">Sadness</th>
<th style="text-align: right;">Ratio</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Ashley</td>
<td style="text-align: right;">2434</td>
<td style="text-align: right;">1168</td>
<td style="text-align: right;">2.08</td>
</tr>
<tr class="even">
<td style="text-align: left;">Laura</td>
<td style="text-align: right;">12633</td>
<td style="text-align: right;">6448</td>
<td style="text-align: right;">1.96</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sam</td>
<td style="text-align: right;">10560</td>
<td style="text-align: right;">5980</td>
<td style="text-align: right;">1.77</td>
</tr>
<tr class="even">
<td style="text-align: left;">Marisha</td>
<td style="text-align: right;">9248</td>
<td style="text-align: right;">5671</td>
<td style="text-align: right;">1.63</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Liam</td>
<td style="text-align: right;">7686</td>
<td style="text-align: right;">4888</td>
<td style="text-align: right;">1.57</td>
</tr>
<tr class="even">
<td style="text-align: left;">Travis</td>
<td style="text-align: right;">8614</td>
<td style="text-align: right;">5630</td>
<td style="text-align: right;">1.53</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Taliesin</td>
<td style="text-align: right;">8867</td>
<td style="text-align: right;">6328</td>
<td style="text-align: right;">1.40</td>
</tr>
</tbody>
</table>

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs
negative](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/positiveNegativePlot.png)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Name</th>
<th style="text-align: right;">Negative</th>
<th style="text-align: right;">Positive</th>
<th style="text-align: right;">Ratio</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Laura</td>
<td style="text-align: right;">16375</td>
<td style="text-align: right;">27145</td>
<td style="text-align: right;">1.66</td>
</tr>
<tr class="even">
<td style="text-align: left;">Ashley</td>
<td style="text-align: right;">2992</td>
<td style="text-align: right;">4821</td>
<td style="text-align: right;">1.61</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Sam</td>
<td style="text-align: right;">13594</td>
<td style="text-align: right;">20595</td>
<td style="text-align: right;">1.52</td>
</tr>
<tr class="even">
<td style="text-align: left;">Taliesin</td>
<td style="text-align: right;">12981</td>
<td style="text-align: right;">19323</td>
<td style="text-align: right;">1.49</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Liam</td>
<td style="text-align: right;">12793</td>
<td style="text-align: right;">17050</td>
<td style="text-align: right;">1.33</td>
</tr>
<tr class="even">
<td style="text-align: left;">Marisha</td>
<td style="text-align: right;">15975</td>
<td style="text-align: right;">20733</td>
<td style="text-align: right;">1.30</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Travis</td>
<td style="text-align: right;">15213</td>
<td style="text-align: right;">19343</td>
<td style="text-align: right;">1.27</td>
</tr>
</tbody>
</table>

Again Liam is near the bottom, but Travis still has a lower score.

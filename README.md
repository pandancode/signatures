
<img src="/app/assets/images/Readme/landingpage-ez.png" alt="landing page" width="100%" height="600">

<h2>what is about?</h2>
<p> EZ-contracts is a product that allows organizations to manage electronic agreements.
Who benefits from this product?</p>

<strong> Companies </strong>
<ul>
  <li>smooth business bureaucracy;</li>
  <li>save space in the office storing contract in the clouds;</li>
  <li>let the company focus on their core mission;</li>
</ul>
<strong> individual/signatories</strong>
<ul>
  <li>no more wasting time, going to the office to sign the contract</li>
  <li>everything safely stored in the clouds</li>
</ul>

<h2>Tech-stack</h2>
<p>go on the website: <a href="https://signing-contr.herokuapp.com/" target="_blank">EZ-contracts</a></p>


<p>Our Product has been created Using ruby and RoR framework for the back end, following the pattern MVC,  for the front-end, we used HTML, CSS and a little of JS.</p>
<p>For Achieving our goal with have to use different Gems to implement the features:</p>

<table>
  <tr>
    <th>GEM</th>
    <th>feature</th>
    <th>description</th>
  </tr>
  <tr>
    <td>PG_search</td>
    <td>search bar</td>
     <td>search bar to find the contracts by name or description available in the section unsigned and signed by name or description.</td>
  </tr>
  <tr>
    <td>device</td>
    <td>log-in and sign-up</td>
    <td>Allow User to create an account on the website.</td>
  </tr>
  <tr>
    <td>combine_pdf</td>
    <td>merge signature on existing pdf</td>
    <td>Permit the signatore to merge the signature on contract.</td>
  </tr>
  <tr>
    <td>pundit</td>
    <td>build the authorization system</td>
    <td>It is to verify if the user is a company or individual so that they can perform different action.</td>
  </tr>
  <tr>
    <td>wicked_pdf</td>
    <td>deal with pdf file uploaded</td>
    <td>We generate a pdf file from a template in the views (HTML) that we fill up with Erb to make the content of the files dynamic. </td>
  </tr>
</table>



<h2>The Features</h2>
<p>EZ-contracts has two type of User Companies and Individuals/Signatories they have different features available. </p>


<p>the feature for the <strong>companies</strong> are as follow: </p>
<ul>
  <li> press sign-Up button, clicking on the dropdown menu select company and provide email and password</li>
  <li>once you signed-up it will be render a form where you will write the detailes of the company</li>
  <li>You can view the list of the unsigned and signed contract that you sent to your stackholder</li>
  <li>You can send the contract to your client pressing the plus icon on the navigation bar. it will appear a form that ask for: name, description, upload the contract and the email of the receiver </li>
  <li>Once the receiver signed your contract you can see it in the section signed and you can download it on your computer</li> 
</ul>

<p>the feature for the <strong> individuals/signatories</strong> are as follow: </p>
<ul>
  <li> press sign-Up button, clicking on the dropdown menu select individual and provide email and password</li>
  <li>once you signed-up it will be render a form where you will write your deatils and you can upload your signature that you have already create for example with <a href="https://signature-generator.com/" target="_blank">this website</a> </li>
  <li>You can view the list of the unsigned and signed contract that you sent to your stackholder</li>
  <li>You can sign the contract clicking on it and it will bring you to the page where show the name and description of it and you find a form where you will insert you first-name and last-name </li>
</ul>

<h2>Reflection</h2>
Building this web application with the team has been challenging but rewarding. We were great at communicating and helping each other to get this product finished on time. We all have been humble, and when we were stuck, we were there to back each of us up. 
This project helped us apply all the knowledge acquired during the Bootcamp and learn how to use the new GEM documentation.

There are a lot of parts that we can do better. For example, the same contract can be signed by multiple people and each user can either send a contract or sign it (at the moment, if you are a company, you can only send a contract, and if you are an individual, you can only sign the contract).

<h2>Thank You</h2>
I want to thank my team for all the support and the great teamwork we have done. 

